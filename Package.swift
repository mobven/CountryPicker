// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CountryPicker",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "CountryPicker",
            targets: ["CountryPicker"]
        )
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "CountryPicker",
            dependencies: [],
            resources: [.copy("Resources/countries.json")]
        ),
        .testTarget(
            name: "CountryPickerTests",
            dependencies: ["CountryPicker"]
        )
    ]
)
