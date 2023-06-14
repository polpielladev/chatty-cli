# 🗣️ Chatty: Your ChatGPT companion in the terminal

Ask ChatGPT anything directly from your terminal!

https://user-images.githubusercontent.com/24246926/227801499-c3729d95-086c-4d7a-ada4-7ae53eacda29.mp4

## Installation

There are currently three ways of installing the app: `homebrew`, `mint` and `directly from Github`.

### Homebrew

```bash
brew install polpielladev/homebrew-tap/chatty-cli
```

### Mint

```bash
mint install polpielladev/chatty-cli@main
```

### Manually

Every time a new version is available, a new Github release is created. You can download the latest version of the executable directly from the [releases page](https://github.com/polpielladev/chatty-cli/releases).

## Usage

Chatty communicates with the [OpenAI API]() to make use of the ChatGPT model. Note you must have an API key with available tokens (either free or pay-as-you-go). You can check your available tokens [here](https://platform.openai.com/account/usage). The first time you use the chatty, you will need to give it an API token using the `auth` command:

```bash
chatty auth
```

https://user-images.githubusercontent.com/24246926/227801076-e96d8e69-36ac-43bd-aefd-9cba554105a2.mp4

🔐 This token will be safely stored in the OSX Keychain and will only be read when needed. Chatty will only know the value of the token for during its execution.

If chatty has already been given a token, you can start a conversation by running chat command:

```bash
# Call chatty and use the default command (which is chat)
chatty

# Call chatty explicitly with the chat command
chatty chat
```
