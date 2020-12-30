// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "study-redis-multiple",
    platforms: [
       .macOS(.v10_15),
    ],
    products: [
        .executable(name: "Run", targets: ["Run"])
    ],
    dependencies: [
        .package(url: "https://github.com/danramteke/redis.git", .branch("master")),
        .package(url: "https://github.com/vapor/vapor.git", from: "4.8.0"),
    ],
    targets: [
        .target(
            name: "App",
            dependencies: [
                .product(name: "Vapor", package: "vapor"), 
                .product(name: "Redis", package: "redis")
            ]),
        .target(
            name: "Run",
            dependencies: ["App"]),
        .testTarget(
            name: "AppTests",
            dependencies: ["App"]),
    ]
)
