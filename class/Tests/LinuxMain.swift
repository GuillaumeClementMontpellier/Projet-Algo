import XCTest

import classTests

var tests = [XCTestCaseEntry]()
tests += classTests.allTests()
XCTMain(tests)