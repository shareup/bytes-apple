import XCTest
@testable import Bytes

final class BytesTests: XCTestCase {
    func testStringValueIsBase16() throws {
        // NOTE: "foo"
        let bytes = Bytes(rawValue: [102, 111, 111])
        XCTAssertEqual("666f6f", bytes.hexEncodedString())

        let sameBytes = try Bytes(hexEncoded: "666f6f")
        XCTAssertEqual([102, 111, 111], sameBytes.rawValue)

        XCTAssertEqual(bytes, sameBytes)
    }

    func testRandom() throws {
        let one = Bytes.random()
        let same = Bytes(rawValue: one.rawValue)

        XCTAssertEqual(one, same)
    }

    static var allTests = [
        ("testStringValueIsBase16", testStringValueIsBase16),
        ("testRandom", testRandom),
    ]
}
