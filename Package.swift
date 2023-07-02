// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NnSwiftUIErrorHandling",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        .library(
            name: "NnSwiftUIErrorHandling",
            targets: ["NnSwiftUIErrorHandling"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "NnSwiftUIErrorHandling",
            dependencies: [],
            path: "Sources"
        ),
    ]
)
