// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DataBase",
    products: [
        .library(
            name: "DataBase",
            targets: ["DataBase"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "DataBase",
            dependencies: []),
        .testTarget(
            name: "DataBaseTests",
            dependencies: ["DataBase"]),
    ]
)
