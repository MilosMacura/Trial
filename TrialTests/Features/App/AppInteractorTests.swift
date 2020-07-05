//
//  AppInteractorTests.swift
//  TrialTests
//
//  Created by Milos on 7/5/20.
//

import SwiftUI
@testable import Trial
import XCTest

// swiftlint:disable implicitly_unwrapped_optional

class AppInteractorTests: XCTestCase {

    var state: AppState!
    var interactor: AppInteractor!
    
    override func setUpWithError() throws {
        self.state = AppState()
        self.interactor = AppInteractor(state: state)
    }

    override func tearDownWithError() throws {
        self.state = nil
        self.interactor = nil
    }

    func testShowTransactions() {
        state.activeViewType = .tourView
        interactor.showTransactionList()
        XCTAssert(state.activeViewType == .transactionScreen)
    }
    
    func testFirstRun() {
        
        let state = AppState()
        state.isFirstRun = true
        _ = AppInteractor(state: state)
        XCTAssert(state.isFirstRun == false)
    }

}
