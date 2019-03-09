import XCTest

import Home

final class HomeTests: XCTestCase {
  func testHomeBuilderBuildsWithoutException() {
    XCTAssertNoThrow(HomeBuilder.build())
  }
}
