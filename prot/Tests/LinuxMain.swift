import XCTest

import protTests

var tests = [XCTestCaseEntry]()
tests += protTests.allTests()
XCTMain(tests)