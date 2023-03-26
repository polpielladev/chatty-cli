import ArgumentParser
import OpenAIStreamingCompletions
import ANSITerminal
import KeychainAccess

class MessageHolder {
    var messages: [OpenAIAPI.Message] = [
        .init(role: .system, content: "You are a helpful assistant. Answer concisely where possible."),
        .init(role: .system, content: "If the questions is about code, provide an example where possible."),
    ]
}

struct Chat: AsyncParsableCommand {
    func run() async throws {
        let messageHolder = MessageHolder()

        writeln("Hi! 👋 looking for an OpenAI token in the keychain...🔒".cyan)
        let keychain = Keychain(service: "dev.polpiella.chatty")
        guard let token = keychain["openaitoken"] else {
            writeln(" ❗️ Something went wrong!  ".onWhite)
            writeln("Could not find an api token, run ".red + "`chatty auth`".magenta.onWhite + " to set it".red)
            
            return
        }
        
        let api = OpenAIAPI(apiKey: token)
        intro()

        while true {
            let prompt = userPrompt()
            try await chattyResponse(api: api, for: prompt, holder: messageHolder)
        }
    }

    private func intro() {
        write("ChatGPT".bold.gray)
        moveRight()
        write(">".bold.gray)
        moveRight()
        write("Hi! I'm chatty, your ChatGPT CLI client 👋")
        moveLineDown()
        write("ChatGPT".bold.gray)
        moveRight()
        write(">".bold.gray)
        moveRight()
        write("🤖 You can ask me anything you want")
    }

    private func chattyResponse(api: OpenAIAPI, for prompt: String, holder: MessageHolder) async throws {
        write("ChatGPT".bold.gray)
        moveRight()
        write(">".bold.gray)

        var currentIndex: String.Index?

        let renderMessage: (String) -> Void = { message in
            let startIndex = currentIndex ?? message.startIndex
            let endIndex = message.endIndex
            currentIndex = endIndex

            write(String(message[startIndex..<endIndex]))
        }

        try await stream(api: api, prompt: prompt, onMessage: renderMessage, holder: holder)
    }

    private func userPrompt() -> String {
        moveLineDown()
        write("user".bold.cyan)
        moveRight()
        write(">".bold.green)
        moveRight()
        return ask("")
    }

    private func stream(api: OpenAIAPI, prompt: String, onMessage: (String) -> Void, holder: MessageHolder) async throws {
        holder.messages.append(.init(role: .user, content: prompt))

        let stream = try api.completeChatStreaming(.init(messages: holder.messages))

        var finalMessage: OpenAIAPI.Message?
        for await message in stream {
            finalMessage = message
            onMessage(message.content)
        }
        
        if let finalMessage { holder.messages.append(finalMessage) }
    }
}
