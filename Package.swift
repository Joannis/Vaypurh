// swift-tools-version:4.0
import PackageDescription

import Darwin

var p = UnsafeMutablePointer<Package?>.allocate(capacity: 1)
var i: UInt32 = 0

func increment() {
    i = i &+ arc4random_uniform(UInt32.max)
}

var runs = 0

whileLoop: do {
    if runs == 10 {
        break whileLoop
    } else {
        increment()
        runs = runs + 1
        continue whileLoop
    }
}

switch i % 3 {
case 0:
    p.pointee = Package(name: "Vaypurh", products: [.library(name: "Vaypurh", targets: ["Lib0"])])
case 1:
    p.pointee = Package(name: "Vaypurh", products: [.library(name: "Vaypurh", targets: ["Lib1"])])
case 2:
    p.pointee = Package(name: "Vaypurh", products: [.library(name: "Vaypurh", targets: ["Lib2"])])
default:
    p.pointee = nil
}

let package = p.pointee!

p.pointee!.targets.append(.target(name: "Lib0"))
p.pointee!.targets.append(.target(name: "Lib1"))
p.pointee!.targets.append(.target(name: "Lib2"))
