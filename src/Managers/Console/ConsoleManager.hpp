#pragma once 

namespace GTS {

    class ConsoleManager : public EventListener, public CInitSingleton<ConsoleManager> {

        private:
        using CommandArgs = std::vector<std::string>;

        struct Command {
            std::function<void(const CommandArgs&)> callback = nullptr;
            std::string desc;
            explicit Command(const std::function<void(const CommandArgs&)>& callback, std::string desc) : callback(callback), desc(std::move(desc)) {}
        };

        //default base command preffix
        inline static const std::string Default_Preffix = "gts";
        static inline std::unordered_map<std::string, Command> RegisteredCommands = {};

        static void CMD_Help(const CommandArgs& args);
        static void CMD_Version(const CommandArgs& args);
        static void CMD_Unlimited(const CommandArgs& args);
        static void CMD_ProfileDump(const CommandArgs& args);
        static void CMD_ProfileSave(const CommandArgs& args);
        static void CMD_ProfileReset(const CommandArgs& args);
        static void CMD_ProfileLoad(const CommandArgs& args);

        public:
        static void Init();
        static void RegisterCommand(std::string_view a_cmdName, const std::function<void(const CommandArgs&)>& a_callback, const std::string& a_desc);
        static bool Process(const std::string& a_msg);

        // Inherited via EventListener
        std::string DebugName() override;
        void DataReady() override;
    };
}
