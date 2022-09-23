// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "Bytes",
    products: [
        .library(
            name: "Bytes",
            targets: ["Bytes"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Bytes",
            dependencies: []
        ),
        .testTarget(
            name: "BytesTests",
            dependencies: ["Bytes"]
        ),
    ]
)
