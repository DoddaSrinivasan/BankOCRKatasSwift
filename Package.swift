// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "bank-ocr-katas",
    products: [
        .executable(name: "bank-ocr-katas", targets: ["bank-ocr-katas"])
    ],
    dependencies: [
        .package(name: "SwiftPM", url: "https://github.com/apple/swift-package-manager.git", .exact("0.4.0")),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.0.5")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "bank-ocr-katas",
            dependencies: [
                .product(name: "SPMUtility", package: "SwiftPM"),
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]
        ),
        .testTarget(
            name: "bank-ocr-katasTests",
            dependencies: ["bank-ocr-katas"]),
    ]
)
