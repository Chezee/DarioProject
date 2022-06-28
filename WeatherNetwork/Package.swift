// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WeatherNetwork",
    platforms: [.iOS("15.0")],
    products: [
        .library(
            name: "WeatherNetwork",
            targets: ["WeatherNetwork"]),
    ],
    dependencies: [
        .package(path: "../DataBase")
    ],
    targets: [
        .target(
            name: "WeatherNetwork",
            dependencies: ["DataBase"]),
        .testTarget(
            name: "WeatherNetworkTests",
            dependencies: ["WeatherNetwork"]),
    ]
)
