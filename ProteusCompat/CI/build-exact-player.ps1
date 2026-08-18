$ErrorActionPreference = 'Stop'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
Set-Location $repo

# Reconstruct the exact patched source uploaded by the tester.
$payloadDir = Join-Path $repo 'ProteusCompat\ExactPlayerSource'
$baseName = 'PhenderixToolEditPlayerScript.psc.gz.b64'
$b64 = ''
foreach ($i in 1..4) {
    $part = Join-Path $payloadDir ($baseName + '.part' + $i)
    if (-not (Test-Path $part)) { throw "Missing source payload part $i" }
    $b64 += (Get-Content $part -Raw).Trim()
}
if ($b64.Length -ne 61172) { throw "Unexpected payload length: $($b64.Length)" }

New-Item -ItemType Directory -Force -Path "$repo\build\player" | Out-Null
$gzPath = "$repo\build\player\PhenderixToolEditPlayerScript.psc.gz"
$pscPath = "$repo\build\player\PhenderixToolEditPlayerScript.psc"
[IO.File]::WriteAllBytes($gzPath, [Convert]::FromBase64String($b64))

$gzHash = (Get-FileHash $gzPath -Algorithm SHA256).Hash.ToLowerInvariant()
if ($gzHash -ne '2b9951051e815cf3839df6fab164a97bfb17ba8a55ae422af394208d784030fe') {
    throw "Gzip payload hash mismatch: $gzHash"
}

$input = [IO.File]::OpenRead($gzPath)
try {
    $gzip = [IO.Compression.GZipStream]::new($input, [IO.Compression.CompressionMode]::Decompress)
    try {
        $output = [IO.File]::Create($pscPath)
        try { $gzip.CopyTo($output) } finally { $output.Dispose() }
    } finally { $gzip.Dispose() }
} finally { $input.Dispose() }

$pscHash = (Get-FileHash $pscPath -Algorithm SHA256).Hash.ToLowerInvariant()
if ($pscHash -ne 'd09a2b0fb9fa3440088b9575ee869d251efa9b7cdd97c99b1a7192b4ce05024b') {
    throw "Patched PSC hash mismatch: $pscHash"
}
Write-Host "Exact patched Player PSC verified before compiler compatibility edits: $pscHash"
Select-String -Path $pscPath -Pattern 'ProteusBeginNewCharacter|ProteusFinalizeNewCharacter|ProteusBeginSwitch|ProteusFinishSwitch' -Context 2,2

# Caprica is stricter than the compiler used for the shipped Proteus PEX and
# rejects two pre-existing local-variable shadowing cases. Rename only those
# locals after verifying the exact uploaded-source hash; behavior is unchanged.
$lines = [System.Collections.Generic.List[string]](Get-Content $pscPath)
$expected = @{
    5451 = 'int k = 0'
    5453 = 'while k < loadedPresetCount'
    5454 = 'if(value  == presetsLoaded[k])'
    5457 = 'k+=1'
    8317 = 'bool addThis = true'
    8320 = 'addThis = false'
    8326 = 'if addThis == true'
}
foreach ($lineNo in $expected.Keys) {
    if ($lines[$lineNo - 1].Trim() -ne $expected[$lineNo]) {
        throw "Unexpected exact PSC content at compiler-fix line $lineNo: '$($lines[$lineNo - 1].Trim())'"
    }
}
$lines[5450] = $lines[5450].Replace('int k = 0', 'int dedupeIndex = 0')
$lines[5452] = $lines[5452].Replace('while k < loadedPresetCount', 'while dedupeIndex < loadedPresetCount')
$lines[5453] = $lines[5453].Replace('presetsLoaded[k]', 'presetsLoaded[dedupeIndex]')
$lines[5456] = $lines[5456].Replace('k+=1', 'dedupeIndex+=1')
$lines[8316] = $lines[8316].Replace('bool addThis = true', 'bool addOtherFollower = true')
$lines[8319] = $lines[8319].Replace('addThis = false', 'addOtherFollower = false')
$lines[8325] = $lines[8325].Replace('if addThis == true', 'if addOtherFollower == true')
[IO.File]::WriteAllText($pscPath, (($lines -join "`n") + "`n"), [Text.UTF8Encoding]::new($false))
Write-Host 'Applied two semantics-preserving Caprica variable-shadowing fixes.'

# Proteus dependency sources are compile-time imports only; the Player PSC above is the exact uploaded version plus the two compiler-only renames.
git clone https://github.com/phenderix/PROTEUS.git deps\proteus
if ($LASTEXITCODE -ne 0) { throw 'Proteus dependency clone failed' }
Set-Location deps\proteus
git checkout fed75f6f30395e15b3d67ea3789e93737c09277a
if ($LASTEXITCODE -ne 0) { throw 'Proteus dependency checkout failed' }
Set-Location $repo

Invoke-WebRequest -Uri 'https://github.com/Orvid/Caprica/releases/download/v0.3.0/Caprica.v0.3.0.7z' -OutFile caprica.7z
New-Item -ItemType Directory -Force -Path tools\caprica | Out-Null
& 'C:\Program Files\7-Zip\7z.exe' x caprica.7z '-otools\caprica' -y
if ($LASTEXITCODE -ne 0) { throw '7-Zip extraction failed' }
$caprica = Get-ChildItem tools\caprica -Recurse -Filter Caprica.exe | Select-Object -First 1
if (-not $caprica) { throw 'Caprica.exe not found' }
Copy-Item $caprica.FullName tools\Caprica.exe -Force

# Skyrim/SKSE headers used by the already-proven Caprica workflow.
git clone --depth 1 https://github.com/Rukan/Grimy-Skyrim-Papyrus-Source.git deps\skyrim
if ($LASTEXITCODE -ne 0) { throw 'Header repository clone failed' }
New-Item -ItemType Directory -Force -Path build\imports | Out-Null
Get-ChildItem deps\skyrim -Filter *.psc -File | Copy-Item -Destination build\imports -Force
Get-ChildItem ProteusCompat\Headers -Filter *.psc -File | Copy-Item -Destination build\imports -Force
'Scriptname Container extends Form Hidden' | Set-Content -Path build\imports\Container.psc -Encoding ASCII
@('', '; SKSE64 light-plugin functions required by Proteus', 'int Function GetLightModCount() native global', 'string Function GetLightModName(int idx) native global') | Add-Content -Path build\imports\Game.psc -Encoding ASCII

@(
    '// List of flags for TESV', '',
    'Flag Hidden 0', '{', '    Script', '    Property', '}', '',
    'Flag Conditional 1', '{', '    Script', '    Variable', '}'
) | Set-Content -Path build\TESV_Papyrus_Flags.flg -Encoding ASCII

New-Item -ItemType Directory -Force -Path build\out | Out-Null
Set-Location "$repo\build\player"
& "$repo\tools\Caprica.exe" --game skyrim --flags "$repo\build\TESV_Papyrus_Flags.flg" --import "$repo\build\imports" --import "$repo\deps\proteus" --output "$repo\build\out" 'PhenderixToolEditPlayerScript.psc'
if ($LASTEXITCODE -ne 0) { throw 'Caprica failed compiling exact Player script' }

Set-Location "$repo\ProteusCompat\Headers"
& "$repo\tools\Caprica.exe" --game skyrim --flags "$repo\build\TESV_Papyrus_Flags.flg" --import "$repo\build\imports" --output "$repo\build\out" 'GTSPlugin.psc'
if ($LASTEXITCODE -ne 0) { throw 'Caprica failed compiling GTSPlugin' }
Set-Location $repo

$playerPex = Get-ChildItem build\out -Recurse -Filter PhenderixToolEditPlayerScript.pex | Select-Object -First 1
$gtsPex = Get-ChildItem build\out -Recurse -Filter GTSPlugin.pex | Select-Object -First 1
if (-not $playerPex) { throw 'Player PEX missing' }
if (-not $gtsPex) { throw 'GTSPlugin PEX missing' }

New-Item -ItemType Directory -Force -Path artifact\Scripts | Out-Null
Copy-Item $playerPex.FullName artifact\Scripts\PhenderixToolEditPlayerScript.pex
Copy-Item $gtsPex.FullName artifact\Scripts\GTSPlugin.pex
Get-ChildItem artifact -Recurse | Select-Object FullName, Length
