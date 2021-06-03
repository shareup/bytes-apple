# Bytes

`Bytes` is a `[UInt8]`-backed struct meant to represent small sequences of bytes and can be used for things like binary headers, identifiers, random bytes, etc. The string representation for `Bytes` is a hex encoded `String`.

## Usage

```swift
struct Key: Hashable {
    let name: String
    let bytes: Bytes

    init(name: String) {
        self.bytes = Bytes.random()
        self.name = name
    }

    init(name: String, bytes: Bytes) {
        self.bytes = bytes
        self.name = name
    }
}

let important = Key(name: "Important", bytes: Bytes(rawValue: [101, 42, 101]))
let random = Key(name: "Random")

// ...
```

## Installation

### Swift Package Manager

To use `Bytes` with the Swift Package Manager, add a dependency to your Package.swift file:
 
 ```swift
 let package = Package(
    dependencies: [
        .package(
            name: "Bytes",
            url: "https://github.com/shareup/bytes-apple.git",
            from: "3.0.0"
        )
    ]
 )
```
