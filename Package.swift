// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "TPNMediationVungleAdapter",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "TPNMediationVungleAdapter",
            targets: ["TPNMediationVungleAdapterTarget"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/topon-packages/TPNiOS_SPM.git", from: "6.5.60"),
        .package(url: "https://github.com/Vungle/VungleAdsSDK-SwiftPackageManager.git", exact: "7.8.0")
    ],
    targets: [
        .binaryTarget(
            name: "AnyThinkVungleAdapter",
            url: "https://topon-sdk-release.oss-accelerate.aliyuncs.com/TPN_Release/iosnetwork_2/AnyThinkVungleAdapter/70800.2.10/AnyThinkVungleAdapter-70800.2.10.zip",
            checksum: "305626b4108c833af076366c369ad98153ba62bc6f81fcc3e2c516c079b54346"
        ),
        .target(
            name: "TPNMediationVungleAdapterTarget",
            dependencies: [
                "AnyThinkVungleAdapter",
                .product(name: "TPNiOS", package: "TPNiOS_SPM"),
                .product(name: "VungleAdsSDK", package: "VungleAdsSDK-SwiftPackageManager")
            ],
            path: "Sources/TPNMediationVungleAdapterTarget"
        )
    ]
)