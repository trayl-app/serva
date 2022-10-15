// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "serva",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "FirebaseAuthService",
            targets: ["FirebaseAuthService"]),
    ],
    dependencies: [
        .package(
            name: "Firebase",
            url: "https://github.com/firebase/firebase-ios-sdk.git",
            .upToNextMajor(from: "9.0.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "FirebaseAuthService",
            dependencies: [
                .product(name: "FirebaseAuth", package: "Firebase"),
            ]),
        .testTarget(
            name: "FirebaseAuthServiceTests",
            dependencies: ["FirebaseAuthService"]),
    ])
