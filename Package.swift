// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "ChattyCLI",
    platforms: [.macOS(.v11)],
    products: [
        .executable(name: "chatty", targets: ["ChattyCLI"])
    ],
    dependencies: [
        .package(url: "https://github.com/nate-parrott/openai-streaming-completions-swift.git", exact: "1.0.1"),
        .package(url: "https://github.com/pakLebah/ANSITerminal.git", exact: "0.0.3"),
        .package(url: "https://github.com/polpielladev/clack-swift", revision: "0d95ad488a21047dc36a9c0ac7f54338ce0c88ca"),
        .package(url: "https://github.com/apple/swift-argument-parser.git", exact: "1.2.2"),
        .package(url: "https://github.com/kishikawakatsumi/KeychainAccess", exact: "4.2.2")
    ],
    targets: [
        .executableTarget(
            name: "ChattyCLI",
            dependencies: [
                .product(name: "OpenAIStreamingCompletions", package: "openai-streaming-completions-swift"),
                "ANSITerminal",
                .product(name: "Clack", package: "clack-swift"),
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "KeychainAccess"
            ]
        )
    ]
)
