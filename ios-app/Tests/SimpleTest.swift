import XCTest

final class SimpleTest: XCTestCase {
  var value: Int = 0

  override func setUp() {
    value = 4
  }

  func testThatWillSucceed() {
    XCTAssertEqual(value, 4)
  }

  static var allTests = [
    ("testThatWillSucceed", testThatWillSucceed),
  ]
}