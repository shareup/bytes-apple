import Foundation

public struct Bytes: ContiguousBytes, CustomStringConvertible, Equatable, Hashable, RawRepresentable {
    public let rawValue: [UInt8]

    public var description: String { hexEncodedString() }
    public var data: Data { Data(rawValue) }

    public enum DecodingError: Error {
        case cannotDecodeHex(String)
    }

    public init(rawValue: [UInt8]) {
        self.rawValue = rawValue
    }

    public init(data: Data) {
        self.init(rawValue: [UInt8](data))
    }

    public init(hexEncoded string: String) throws {
        if string.count % 2 == 0 && string.allSatisfy({ $0.isHexDigit }) {
            let bytes = stride(from: 0, to: string.count, by: 2).map { i -> UInt8 in
                let startIndex = string.index(string.startIndex, offsetBy: i)
                let endIndex = string.index(string.startIndex, offsetBy: i + 1)
                return UInt8(string[startIndex ... endIndex], radix: 16)!
            }

            self.init(rawValue: bytes)
        } else {
            throw DecodingError.cannotDecodeHex(string)
        }
    }

    public func hexEncodedString() -> String {
        return rawValue.map {
            let encoded = String($0, radix: 16)

            if (encoded.count == 2) {
                return encoded
            } else {
                return "0\(encoded)"
            }
        }.joined()
    }

    public func withUnsafeBytes<R>(_ body: (UnsafeRawBufferPointer) throws -> R) rethrows -> R {
        try rawValue.withUnsafeBytes(body)
    }

    public static func random(size count: Int = 32) -> Self {
        var bytes = [UInt8](repeating: 0, count: count)

        if SecRandomCopyBytes(kSecRandomDefault, bytes.count, &bytes) != errSecSuccess {
            fatalError("Cannot generate random bytes.")
        }

        return Self(rawValue: bytes)
    }
}
