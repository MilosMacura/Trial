//
//  TransactionListStateTests.swift
//  TrialTests
//
//  Created by Milos on 7/5/20.
//

@testable import Trial
import XCTest

// swiftlint:disable implicitly_unwrapped_optional

class TransactionListStateTests: XCTestCase {

    var state: TransactionListState!
    var interactor: TransactionListInteractable!
    var networkService: TransactionsAPIProtocol!
    
    override func setUpWithError() throws {
        self.state = TransactionListState()
        self.networkService = TransactionsAPIMock()
        self.interactor = TransactionListInteractor(state: state,
                                                    networkService: networkService)
    }

    override func tearDownWithError() throws {
        self.state = nil
    }

    func testCorrectSum() {
        XCTAssert(self.state.transactionValueSum == "0")
        interactor.getTransactions()
        XCTAssert(self.state.transactionValueSum == "2")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
