//
//  DetailUITests.swift
//  TrialUITests
//
//  Created by Milos on 7/5/20.
//

import XCTest

// swiftlint:disable implicitly_unwrapped_optional

class TransactionDetailUITests: XCTestCase {

    private var app: XCUIApplication!
    private var helper: UITestHelper!
    
    override func setUpWithError() throws {
        
        continueAfterFailure = false
        
        self.app = XCUIApplication()
        self.helper = UITestHelper(app: app)
        
        self.app.launchArguments += ["-firstRun", "NO"]
        self.app.launch()
        self.helper.skipTour()
        self.helper.skipList()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testDetailElements() throws {

        XCTAssert(app.images["creditcard"].exists)
        XCTAssert(app.staticTexts["DM-FIL. 0609"].exists)
        XCTAssert(app.staticTexts["Payment with card 1 on the 10. Feb. at 17:38."].exists)
    }

}
