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
        .binaryTarget(
            name: "CocoaLumberjack",
            url: "https://github.com/swift-precompiled/CocoaLumberjack/releases/download/3.9.0/CocoaLumberjack-15726dea84ff54bd84511e2c184794fcd2256495c7346fa5d4af8cc1fd93a57b.xcframework.zip",
            checksum: "15726dea84ff54bd84511e2c184794fcd2256495c7346fa5d4af8cc1fd93a57b"
        ),
        .binaryTarget(
            name: "CocoaLumberjackSwiftSupport",
            url: "https://github.com/swift-precompiled/CocoaLumberjack/releases/download/3.9.0/CocoaLumberjackSwiftSupport-ce3b74e76814c0ee44f1f8f4c50d079c08ffbd5938ba67bd626afed6f9f8b30f.xcframework.zip",
            checksum: "ce3b74e76814c0ee44f1f8f4c50d079c08ffbd5938ba67bd626afed6f9f8b30f"
        ),
        .target(
            name: "CocoaLumberjackSwift_Aggregation",
            dependencies: ["CocoaLumberjackSwift"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "CocoaLumberjackSwift",
            url: "https://github.com/swift-precompiled/CocoaLumberjack/releases/download/3.9.0/CocoaLumberjackSwift-6e65a68fc977c034d979e7677aa5e61708aca6433a223fa093ad11a338fd5408.xcframework.zip",
            checksum: "6e65a68fc977c034d979e7677aa5e61708aca6433a223fa093ad11a338fd5408"
        ),
        .target(
            name: "CocoaLumberjackSwiftLogBackend_Aggregation",
            dependencies: ["CocoaLumberjackSwiftLogBackend"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "CocoaLumberjackSwiftLogBackend",
            url: "https://github.com/swift-precompiled/CocoaLumberjack/releases/download/3.9.0/CocoaLumberjackSwiftLogBackend-a1c660165c4f0e8cc3cf2b85d1f289bf34232b65b56fb607301558681ac7c43d.xcframework.zip",
            checksum: "a1c660165c4f0e8cc3cf2b85d1f289bf34232b65b56fb607301558681ac7c43d"
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