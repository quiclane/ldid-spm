// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "ldid-spm",
    platforms: [
        .macOS(.v12),
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "CLDID",
            targets: ["CLDID"]
        )
    ],
    targets: [
        .target(
            name: "CLDID",
            path: "Sources",
            publicHeadersPath: "."
        )
    ]
)
