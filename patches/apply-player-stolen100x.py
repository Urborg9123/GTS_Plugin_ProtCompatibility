from pathlib import Path


def replace_once(path: str, old: str, new: str, label: str) -> None:
    p = Path(path)
    text = p.read_text(encoding="utf-8").replace("\r\n", "\n")
    count = text.count(old)
    if count != 1:
        raise SystemExit(f"{label}: expected exactly one source match, found {count}")
    p.write_text(text.replace(old, new), encoding="utf-8", newline="\n")
    print(f"Applied {label}")


# Preserve the earlier NPC profile-read addon, but at normal 1x strength.
getter_old = '''\tfloat GetStolenAttributes_Values(Actor* giant, ActorValue type) {
\t\tif (giant->IsPlayerRef()) {
\t\t\tauto Persistent = Persistent::GetActorData(giant);
\t\t\tif (Persistent) {
\t\t\t\tfloat max = GetStolenAttributeCap(giant);
\t\t\t\tif (type == ActorValue::kHealth) {
\t\t\t\t\treturn std::min(Persistent->fStolenHealth, max);
\t\t\t\t} else if (type == ActorValue::kMagicka) {
\t\t\t\t\treturn std::min(Persistent->fStolenMagicka, max);
\t\t\t\t} else if (type == ActorValue::kStamina) {
\t\t\t\t\treturn std::min(Persistent->fStolenStamina, max);
\t\t\t\t} else {
\t\t\t\t\treturn 0.0f;
\t\t\t\t}
\t\t\t}
\t\t\treturn 0.0f;
\t\t}
\t\treturn 0.0f;
\t}'''

getter_new = '''\tfloat GetStolenAttributes_Values(Actor* giant, ActorValue type) {
\t\tif (!giant) {
\t\t\treturn 0.0f;
\t\t}

\t\tauto Persistent = Persistent::GetActorData(giant);
\t\tif (Persistent) {
\t\t\tconst float max = GetStolenAttributeCap(giant);
\t\t\tif (type == ActorValue::kHealth) {
\t\t\t\treturn std::min(Persistent->fStolenHealth, max);
\t\t\t} else if (type == ActorValue::kMagicka) {
\t\t\t\treturn std::min(Persistent->fStolenMagicka, max);
\t\t\t} else if (type == ActorValue::kStamina) {
\t\t\t\treturn std::min(Persistent->fStolenStamina, max);
\t\t\t}
\t\t}
\t\treturn 0.0f;
\t}'''

# Positive storage earnings are 100x. Negative values are drains and must remain 1x.
earning_old = '''\t\t\t\t} else { // Add in all other cases
\t\t\t\t\tattributes->fStolenAttibutes += value;
\t\t\t\t\tattributes->fStolenAttibutes = std::max(attributes->fStolenAttibutes, 0.0f);
\t\t\t\t}'''

earning_new = '''\t\t\t\t} else { // Add in all other cases
\t\t\t\t\tconst float adjustedValue = value > 0.0f ? value * 100.0f : value;
\t\t\t\t\tattributes->fStolenAttibutes += adjustedValue;
\t\t\t\t\tattributes->fStolenAttibutes = std::max(attributes->fStolenAttibutes, 0.0f);
\t\t\t\t}'''

# Direct targeted permanent gains are also 100x when positive.
towards_old = '''\tvoid AddStolenAttributesTowards(Actor* giant, ActorValue type, float value) {
\t\tif (giant->IsPlayerRef()) {
\t\t\tauto Persistent = Persistent::GetActorData(giant);'''

towards_new = '''\tvoid AddStolenAttributesTowards(Actor* giant, ActorValue type, float value) {
\t\tif (giant->IsPlayerRef()) {
\t\t\tif (value > 0.0f) {
\t\t\t\tvalue *= 100.0f;
\t\t\t}
\t\t\tauto Persistent = Persistent::GetActorData(giant);'''

# Conversion of temporary storage into permanent H/M/S is 100x.
distribute_old = '''\t\t\tfloat& health = Persistent->fStolenHealth;
\t\t\tfloat& magick = Persistent->fStolenMagicka;
\t\t\tfloat& stamin = Persistent->fStolenStamina;

\t\t\tvalue = std::clamp(value, 0.0f, Storage); // Can't be stronger than storage bonus'''

distribute_new = '''\t\t\tfloat& health = Persistent->fStolenHealth;
\t\t\tfloat& magick = Persistent->fStolenMagicka;
\t\t\tfloat& stamin = Persistent->fStolenStamina;

\t\t\tvalue *= 100.0f;
\t\t\tvalue = std::clamp(value, 0.0f, Storage); // Can't be stronger than storage bonus'''

replace_once("src/Utils/Actor/GTSUtils.cpp", getter_old, getter_new, "NPC stolen attribute reads at 1x")
replace_once("src/Utils/Actor/GTSUtils.cpp", earning_old, earning_new, "Player stolen attribute storage earning at 100x")
replace_once("src/Utils/Actor/GTSUtils.cpp", towards_old, towards_new, "Player targeted stolen attribute gain at 100x")
replace_once("src/Utils/Actor/GTSUtils.cpp", distribute_old, distribute_new, "Player stolen attribute distribution at 100x")
