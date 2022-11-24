// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Dividers",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
        .tvOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "Dividers",
            targets: ["Dividers"]),
    ],
    targets: [
        .target(
            name: "Dividers",
            dependencies: [])
    ]
)
