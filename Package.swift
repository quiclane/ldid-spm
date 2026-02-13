// swift-tools-version:6.2
import PackageDescription

let package = Package(
    name: "ldid-spm",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "LDIDShim",
            targets: ["LDIDShim"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/quiclane/boringssl-spm.git", from: "1.0.0"),
        .package(url: "https://github.com/quiclane/libplist-spm.git", from: "1.0.0")
    ],
    targets: [
        .binaryTarget(
            name: "LDIDBinary",
            path: "Sources/LDIDBinary/LDID.xcframework"
        ),
        .target(
            name: "LDIDShim",
            dependencies: [
                "LDIDBinary",
                .product(name: "BoringSSL", package: "boringssl-spm"),
                .product(name: "LibPlist", package: "libplist-spm")
            ],
            path: "Sources/LDIDShim"
        )
    ]
)
