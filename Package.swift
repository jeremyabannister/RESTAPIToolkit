// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "RESTAPIToolkit",
    platforms: [.macOS(.v10_15), .iOS(.v13), .watchOS(.v3), .tvOS(.v10)],
    products: [
        .library(
            name: "RESTAPIToolkit",
            targets: ["RESTAPIToolkit"]
        ),
        .library(
            name: "RESTAPITestToolkit",
            targets: ["RESTAPITestToolkit"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/jeremyabannister/DateToolkit",
            from: "0.2.1"
        )
    ],
    targets: [
        .target(
            name: "RESTAPIToolkit",
            dependencies: ["DateToolkit"]
        ),
        .target(
            name: "RESTAPITestToolkit",
            dependencies: [
                "RESTAPIToolkit",
                .product(name: "DateTestToolkit", package: "DateToolkit")
            ]
        ),
        .testTarget(
            name: "RESTAPIToolkit-tests",
            dependencies: ["RESTAPITestToolkit"]
        ),
        .testTarget(
            name: "RESTAPITestToolkit-tests",
            dependencies: ["RESTAPITestToolkit"]
        ),
    ]
)
