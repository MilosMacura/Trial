//
//  DateFormatterTests.swift
//  TrialTests
//
//  Created by Milos on 7/5/20.
//
@testable import Trial
import XCTest

class DateFormatterTests: XCTestCase {

    func testShortDateFormatter() throws {
        let shortDateFormatter = DateFormatter.shortDateFormatter
        XCTAssert(shortDateFormatter.dateStyle == .short)
    }

}
