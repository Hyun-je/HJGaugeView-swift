// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HJGaugeView",
    platforms: [
        .macOS(.v10_12), .iOS(.v11)
    ],
    products: [
        .library(
            name: "HJGaugeView",
            targets: ["HJGaugeView"]),
    ],
    targets: [
        .target(
            name: "HJGaugeView",
            dependencies: []),
    ]
)
