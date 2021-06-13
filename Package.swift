// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DjangoTranslator",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "DjangoTranslator",
            targets: ["DjangoTranslator"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.45.2"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.2.0"),
    ],
    targets: [
        .target(
            name: "DjangoTranslator",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "Fluent", package: "fluent")
            ], resources: [
                .copy("DjangoBuddy")
            ]),
        .testTarget(
            name: "DjangoTranslatorTests",
            dependencies: [
                .target(name: "DjangoTranslator"),
                .product(name: "Vapor", package: "vapor"),
                .product(name: "Fluent", package: "fluent")
            ]),
    ]
)
