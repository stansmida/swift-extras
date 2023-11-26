import SwiftExtras
import XCTest

final class Equatable_ExtrasTests: XCTestCase {

    func testIsEqualTo_whenEqual_shouldEqual() throws {
        let x: any Equatable = "a"
        let y: any Equatable = "a"
        XCTAssertTrue(x.isEqual(to: y))
        XCTAssertTrue(y.isEqual(to: x))
    }

    func testIsEqualTo_whenNotEqual_shouldNotEqual() throws {
        let x: any Equatable = "a"
        let y: any Equatable = "b"
        XCTAssertFalse(x.isEqual(to: y))
        XCTAssertFalse(y.isEqual(to: x))
    }

    func testIsEqualTo_whenDifferentType_shouldNotEqual() {
        let x: Double = 2
        let y: Float = 2
        XCTAssertFalse(x.isEqual(to: y))
        XCTAssertFalse(y.isEqual(to: x))
    }

    func testOptionalIsEqualToEquatable_whenEqual_shouldEqual() {
        let x: (any Equatable)? = "a"
        let y: any Equatable = "a"
        XCTAssertTrue(x.isEqual(to: y))
    }

    func testOptionalIsEqualToEquatable_whenNotEqual_shouldNotEqual() {
        let x: (any Equatable)? = "a"
        let y: any Equatable = "b"
        let z: (any Equatable)? = nil
        XCTAssertFalse(x.isEqual(to: y))
        XCTAssertFalse(z.isEqual(to: y))
    }

    func testOptionalIsEqualToOptionalEquatable_whenEqual_shouldEqual() {
        let x: (any Equatable)? = 1
        let y: (any Equatable)? = 1
        let a: (any Equatable)? = nil
        let b: (any Equatable)? = nil
        XCTAssertTrue(x.isEqual(to: y))
        XCTAssertTrue(y.isEqual(to: x))
        XCTAssertTrue(a.isEqual(to: b))
        XCTAssertTrue(b.isEqual(to: a))
    }

    func testOptionalIsEqualToOptionalEquatable_whenNotEqual_shouldNotEqual() {
        let x: (any Equatable)? = 1
        let y: (any Equatable)? = 0
        let z: (any Equatable)? = nil
        XCTAssertFalse(x.isEqual(to: y))
        XCTAssertFalse(y.isEqual(to: x))
        XCTAssertFalse(x.isEqual(to: z))
        XCTAssertFalse(z.isEqual(to: x))
        XCTAssertFalse(y.isEqual(to: z))
        XCTAssertFalse(z.isEqual(to: y))
    }
}
