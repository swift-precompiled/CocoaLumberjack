// swift-tools-version:6.1.0

import PackageDescription
import Foundation

let package = Package(
    name: "CocoaLumberjack",
    platforms: [
        .macOS("10.13"),
        .iOS("12.0"),
        .tvOS("12.0"),
        .watchOS("5.0"),
        .visionOS("1.0")
    ],
    products: [
        .library(
            name: "CocoaLumberjack",
            targets: ["CocoaLumberjack_PrecompiledProduct"]
        ),
        .library(
            name: "CocoaLumberjackSwift",
            targets: ["CocoaLumberjackSwift_PrecompiledProduct"]
        ),
        .library(
            name: "CocoaLumberjackSwiftLogBackend",
            targets: ["CocoaLumberjackSwiftLogBackend_PrecompiledProduct"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-precompiled/swift-log",
            exact: "1.6.3"
        )
    ],
    targets: [
        .target(
            name: "CocoaLumberjack",
            dependencies: ["CocoaLumberjack_PrecompiledArchive"],
            path: "Sources/CocoaLumberjack",
            sources: ["Empty.m"],
            publicHeadersPath: "include"
        ),
        .binaryTarget(
            name: "CocoaLumberjack_PrecompiledArchive",
            url: "https://github.com/swift-precompiled/CocoaLumberjack/releases/download/3.9.0/CocoaLumberjack-23326ec5f3842d9ceb53e108fb1359ced835cbea9eedc814e1611ec1c545cfc6.xcframework.zip",
            checksum: "23326ec5f3842d9ceb53e108fb1359ced835cbea9eedc814e1611ec1c545cfc6"
        ),
        .target(
            name: "CocoaLumberjackSwiftSupport",
            dependencies: ["CocoaLumberjackSwiftSupport_PrecompiledArchive", "CocoaLumberjack"],
            path: "Sources/CocoaLumberjackSwiftSupport",
            sources: ["Empty.c"],
            publicHeadersPath: "include"
        ),
        .binaryTarget(
            name: "CocoaLumberjackSwiftSupport_PrecompiledArchive",
            url: "https://github.com/swift-precompiled/CocoaLumberjack/releases/download/3.9.0/CocoaLumberjackSwiftSupport-d5f2dee3c699c62552443d8bf069a9ae86d53c8a9fefa1b9d15934b3649c0640.xcframework.zip",
            checksum: "d5f2dee3c699c62552443d8bf069a9ae86d53c8a9fefa1b9d15934b3649c0640"
        ),
        .target(
            name: "CocoaLumberjackSwift_Aggregation",
            dependencies: ["CocoaLumberjackSwift"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "CocoaLumberjackSwift",
            url: "https://github.com/swift-precompiled/CocoaLumberjack/releases/download/3.9.0/CocoaLumberjackSwift-de9f7d37f9ba3f0d4ce17168872e5bdfc641e29f93f5d098e3adc75ab1c6b628.xcframework.zip",
            checksum: "de9f7d37f9ba3f0d4ce17168872e5bdfc641e29f93f5d098e3adc75ab1c6b628"
        ),
        .target(
            name: "CocoaLumberjackSwiftLogBackend_Aggregation",
            dependencies: ["CocoaLumberjackSwiftLogBackend"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "CocoaLumberjackSwiftLogBackend",
            url: "https://github.com/swift-precompiled/CocoaLumberjack/releases/download/3.9.0/CocoaLumberjackSwiftLogBackend-667bde12fe1ec50ffa9404b1f487749247fce7c9509e3c8d636b91b1f7eab29b.xcframework.zip",
            checksum: "667bde12fe1ec50ffa9404b1f487749247fce7c9509e3c8d636b91b1f7eab29b"
        ),
        .target(
            name: "CocoaLumberjack_PrecompiledProduct",
            dependencies: ["CocoaLumberjack"]
        ),
        .target(
            name: "CocoaLumberjackSwift_PrecompiledProduct",
            dependencies: [
                "CocoaLumberjackSwift_Aggregation",
                "CocoaLumberjack",
                "CocoaLumberjackSwiftSupport"
            ]
        ),
        .target(
            name: "CocoaLumberjackSwiftLogBackend_PrecompiledProduct",
            dependencies: [
                "CocoaLumberjackSwiftLogBackend_Aggregation",
                "CocoaLumberjack",
                .product(
                    name: "Logging",
                    package: "swift-log"
                )
            ]
        )
    ]
)