//
//  UITestHelpers.swift
//  TrialUITests
//
//  Created by Milos on 7/5/20.
//

import XCTest

class UITestHelper {
    
    private let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    func skipTour() {
        app.buttons["chevron.right.2"].tap()
    }
    
    func skipList() {
        app.tables/*@START_MENU_TOKEN@*/.cells["2/12/18\nDM-FIL. 0609\nPayment with card 1 on the 10. Feb. at 17:38.\n-15.55 EUR"].buttons["2/12/18\nDM-FIL. 0609\nPayment with card 1 on the 10. Feb. at 17:38.\n-15.55 EUR"]/*[[".cells[\"2\/12\/18\\nDM-FIL. 0609\\nPayment with card 1 on the 10. Feb. at 17:38.\\n-15.55 EUR\"].buttons[\"2\/12\/18\\nDM-FIL. 0609\\nPayment with card 1 on the 10. Feb. at 17:38.\\n-15.55 EUR\"]",".buttons[\"2\/12\/18\\nDM-FIL. 0609\\nPayment with card 1 on the 10. Feb. at 17:38.\\n-15.55 EUR\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
    }
}
