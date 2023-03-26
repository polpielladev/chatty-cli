# 🗣️ Chatty: Your ChatGPT companion in the terminal

Ask ChatGPT anything directly from your terminal!

https://user-images.githubusercontent.com/24246926/227801499-c3729d95-086c-4d7a-ada4-7ae53eacda29.mp4

## Installation

Currently, chatty can only be installed using [Mint 🌱](https://github.com/yonaskolb/Mint):

```bash
mint install polpielladev/chatty-cli@main
```

## Usage

Chatty communicates with the [OpenAI API]() to make use of the ChatGPT model. The first time you use the chatty, you will need to give it an API token using the `auth` command:

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
