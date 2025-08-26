// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "ScoutWeb",
  platforms: [
    .macOS(.v15),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.6.1"),
    .package(url: "https://github.com/ClutchEngineering/slipstream.git", branch: "main"),
  ],
  targets: [
    .executableTarget(name: "ScoutWeb", dependencies: [
      .product(name: "ArgumentParser", package: "swift-argument-parser"),
      .product(name: "Slipstream", package: "slipstream"),
    ]),
  ]
)
