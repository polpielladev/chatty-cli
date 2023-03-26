import ArgumentParser

@main
struct ChattyCLI: AsyncParsableCommand {
    static var configuration: CommandConfiguration = CommandConfiguration(
        commandName: "chatty",
        subcommands: [Auth.self, Chat.self],
        defaultSubcommand: Chat.self
    )
}
