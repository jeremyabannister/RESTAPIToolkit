// swift-tools-version:5.6

///
import PackageDescription

///
let package = Package(
    name: "RESTAPIToolkit",
    platforms: [.macOS(.v10_15), .iOS(.v13), .watchOS(.v3), .tvOS(.v10)],
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
            from: "0.1.0"
        )
    ],
    targets: [
        
        ///
        .target(
            name: "RESTAPIToolkit",
            dependencies: [
                
                ///
                "FoundationToolkit"
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
                )
            ]
        ),
        
        ///
        .testTarget(
            name: "RESTAPIToolkit-tests",
            dependencies: ["RESTAPITestToolkit"]
        ),
        
        ///
        .testTarget(
            name: "RESTAPITestToolkit-tests",
            dependencies: ["RESTAPITestToolkit"]
        ),
    ]
)
