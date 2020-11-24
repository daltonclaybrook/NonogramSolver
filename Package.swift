// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NonogramSolver",
    products: [
        .executable(name: "NonogramSolver", targets: ["NonogramSolver"])
    ],
    dependencies: [],
    targets: [
        .target(name: "NonogramSolver", dependencies: []),
        .testTarget(name: "NonogramSolverTests", dependencies: ["NonogramSolver"]),
    ]
)
