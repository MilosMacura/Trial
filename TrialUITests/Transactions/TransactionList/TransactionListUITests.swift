//
//  ListUITests.swift
//  TrialUITests
//
//  Created by Milos on 7/5/20.
//

import XCTest

// swiftlint:disable implicitly_unwrapped_optional

class TransactionListUITests: XCTestCase {
    
    private var app: XCUIApplication!
    private var helper: UITestHelper!
    
    override func setUpWithError() throws {
        
        continueAfterFailure = false
        
        self.app = XCUIApplication()
        self.helper = UITestHelper(app: app)
        
        self.app.launchArguments += ["-firstRun", "NO"]
        self.app.launch()
        self.helper.skipTour()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testCorrectCellDisplay() throws {
    
        let cell = app.tables/*@START_MENU_TOKEN@*/.cells["2/12/18\nDM-FIL. 0609\nPayment with card 1 on the 10. Feb. at 17:38.\n-15.55 EUR"].buttons["2/12/18\nDM-FIL. 0609\nPayment with card 1 on the 10. Feb. at 17:38.\n-15.55 EUR"]/*[[".cells[\"2\/12\/18\\nDM-FIL. 0609\\nPayment with card 1 on the 10. Feb. at 17:38.\\n-15.55 EUR\"].buttons[\"2\/12\/18\\nDM-FIL. 0609\\nPayment with card 1 on the 10. Feb. at 17:38.\\n-15.55 EUR\"]",".buttons[\"2\/12\/18\\nDM-FIL. 0609\\nPayment with card 1 on the 10. Feb. at 17:38.\\n-15.55 EUR\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
        let exists = NSPredicate(format: "exists == 1")

        expectation(for: exists, evaluatedWith: cell, handler: nil)
        waitForExpectations(timeout: 100, handler: nil)
    }
    
    func testDetailDisplay() throws {
        
        app.tables/*@START_MENU_TOKEN@*/.cells["2/12/18\nDM-FIL. 0609\nPayment with card 1 on the 10. Feb. at 17:38.\n-15.55 EUR"].buttons["2/12/18\nDM-FIL. 0609\nPayment with card 1 on the 10. Feb. at 17:38.\n-15.55 EUR"]/*[[".cells[\"2\/12\/18\\nDM-FIL. 0609\\nPayment with card 1 on the 10. Feb. at 17:38.\\n-15.55 EUR\"].buttons[\"2\/12\/18\\nDM-FIL. 0609\\nPayment with card 1 on the 10. Feb. at 17:38.\\n-15.55 EUR\"]",".buttons[\"2\/12\/18\\nDM-FIL. 0609\\nPayment with card 1 on the 10. Feb. at 17:38.\\n-15.55 EUR\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        
        let detailText = app.staticTexts["Payment with card 1 on the 10. Feb. at 17:38."]
        XCTAssert(detailText.exists)
        
    }
    
}
