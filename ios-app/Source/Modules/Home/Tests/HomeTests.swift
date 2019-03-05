import XCTest

import Home
import HomeBase

final class HomeTests: XCTestCase {
  func testHomeBuilderBuildsWithoutException() {
    XCTAssertNoThrow(HomeBuilder.build())
  }
}
