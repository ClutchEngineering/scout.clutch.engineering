// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "ScoutWeb",
  dependencies: [
    .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.6.1"),
  ],
  targets: [
    .executableTarget(name: "ScoutWeb", dependencies: [
      .product(name: "ArgumentParser", package: "swift-argument-parser"),
    ]),
  ]
)

