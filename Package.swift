// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Glassmorphism",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
        .tvOS(.v16),
        .watchOS(.v9)
    ],
    products: [
        .library(
            name: "Glassmorphism",
            targets: ["Glassmorphism"]
        )
    ],
    targets: [
        .target(
            name: "Glassmorphism",
            dependencies: []
        ),
        .testTarget(
            name: "GlassmorphismTests",
            dependencies: ["Glassmorphism"]
        )
    ]
)
