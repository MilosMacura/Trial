//
//  TourViewStateTests.swift
//  TrialTests
//
//  Created by Milos on 7/5/20.
//

import SwiftUI
@testable import Trial
import XCTest

// swiftlint:disable implicitly_unwrapped_optional

class TourViewStateTests: XCTestCase {

    var state: TourViewState!
    
    override func setUpWithError() throws {
        self.state = TourViewState()
    }

    override func tearDownWithError() throws {
        self.state = nil
    }

    func testBackgroundColorChange() throws {
        self.state.activeTab = .welcome
        XCTAssert(self.state.backgroundColor == Color.pleasantBlue)
        
        self.state.activeTab = .middle
        XCTAssert(self.state.backgroundColor == Color.pleasantGreen)
        
        self.state.activeTab = .final
        XCTAssert(self.state.backgroundColor == Color.pleasantRed)
    }

}
