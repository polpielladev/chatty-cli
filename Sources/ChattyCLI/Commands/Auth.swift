import Clack
import ArgumentParser
import KeychainAccess

struct Auth: AsyncParsableCommand {
    func run() async throws {
        intro(title: "Hi! 👋 Set your token to use Chatty!")
        
        let validator = Validator(validate: { !$0.isEmpty }, failureString: "The OpenAI API token can not be empty...")
        let token = text(question: "Enter your OpenAPI token", placeholder: "sk-...", validator: validator, isSecureEntry: true)
        
        let keychain = Keychain(service: "dev.polpiella.chatty")
        keychain["openaitoken"] = token
        
        outro(text: "✅ You're all set! You can now run " + "`chatty`".magenta.onWhite + "to converse...")
    }
}
