// swift-tools-version:5.8

///
import PackageDescription

///
let package = Package(
    name: "RESTAPIToolkit",
    platforms: [.macOS(.v10_15), .iOS(.v13), .watchOS(.v5), .tvOS(.v11)],
    products: [
        
        ///
        .library(
            name: "RESTAPIToolkit",
            targets: ["RESTAPIToolkit"]
        ),
        
        ///
        .library(
            name: "RESTAPITestToolkit",
            targets: ["RESTAPITestToolkit"]
        ),
    ],
    dependencies: [
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/FoundationToolkit",
            .upToNextMinor(from: "0.8.5")
        )
    ],
    targets: [
        
        ///
        .target(
            name: "RESTAPIToolkit",
            dependencies: [
                
                ///
                "FoundationToolkit",
            ]
        ),
        
        ///
        .target(
            name: "RESTAPITestToolkit",
            dependencies: [
                
                ///
                "RESTAPIToolkit",
                
                ///
                .product(
                    name: "FoundationTestToolkit",
                    package: "FoundationToolkit"
                ),
            ]
        ),
        
        ///
        .testTarget(
            name: "RESTAPIToolkit-tests",
            dependencies: [
                "RESTAPITestToolkit",
            ]
        ),
        
        ///
        .testTarget(
            name: "RESTAPITestToolkit-tests",
            dependencies: [
                "RESTAPITestToolkit",
            ]
        ),
    ]
)
