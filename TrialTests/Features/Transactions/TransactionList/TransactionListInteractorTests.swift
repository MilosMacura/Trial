//
//  TransactionListInteractorTests.swift
//  TrialTests
//
//  Created by Milos on 7/5/20.
//

@testable import Trial
import XCTest

// swiftlint:disable implicitly_unwrapped_optional

class TransactionListInteractorTests: XCTestCase {

    var state: TransactionListState!
    var networkService: TransactionsAPIProtocol!
    var interactor: TransactionListInteractor!
    
    override func setUpWithError() throws {
        self.state = TransactionListState()
        self.networkService = TransactionsAPIMock()
        self.interactor = TransactionListInteractor(state: self.state,
                                                    networkService: self.networkService)
    }

    override func tearDownWithError() throws {
        self.state = nil
        self.networkService = nil
        self.interactor = nil
    }

    func testGetTransactions() {
        XCTAssert(state.transactions.isEmpty)
        interactor.getTransactions()
        XCTAssert(state.transactions.count == 3)
    }

}
