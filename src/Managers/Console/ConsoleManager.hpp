#pragma once 

namespace GTS {

    class ConsoleManager : public EventListener, public CInitSingleton<ConsoleManager> {

        public:
        using CommandArgs = std::vector<std::string>;

        private:
        struct Command {
            std::function<void()> callback = nullptr;
            std::function<void(const CommandArgs&)> callbackArgs = nullptr;
            std::string desc;

            explicit Command(const std::function<void()>& callback, std::string desc) :
                callback(callback), desc(std::move(desc)) {}

            explicit Command(const std::function<void(const CommandArgs&)>& callbackArgs, std::string desc) :
                callbackArgs(callbackArgs), desc(std::move(desc)) {}
        };

        //default base command preffix
        inline static const std::string Default_Preffix = "gts";
        static inline std::unordered_map<std::string, Command> RegisteredCommands = {};

        static void CMD_Help();
        static void CMD_Version();
        static void CMD_Unlimited();
        static void CMD_ProfileDump(const CommandArgs& args);
        static void CMD_ProfileSave(const CommandArgs& args);
        static void CMD_ProfileReset(const CommandArgs& args);
        static void CMD_ProfileLoad(const CommandArgs& args);

        public:
        static void Init();
        static void RegisterCommand(std::string_view a_cmdName, const std::function<void()>& a_callback, const std::string& a_desc);
        static void RegisterCommand(std::string_view a_cmdName, const std::function<void(const CommandArgs&)>& a_callback, const std::string& a_desc);
        static bool Process(const std::string& a_msg);

        // Inherited via EventListener
        std::string DebugName() override;
        void DataReady() override;
    };
}
