// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Bytes",
    products: [
        .library(
            name: "Bytes",
            targets: ["Bytes"]),
        .library(
            name: "BytesDynamic",
            type: .dynamic,
            targets: ["Bytes"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Bytes",
            dependencies: []),
        .testTarget(
            name: "BytesTests",
            dependencies: ["Bytes"]),
    ]
)
