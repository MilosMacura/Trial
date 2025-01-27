//
//  TransactionsAPITests.swift
//  TrialTests
//
//  Created by Milos on 7/5/20.
//

@testable import Trial
import XCTest

// swiftlint:disable implicitly_unwrapped_optional

class TransactionsAPITests: XCTestCase {

    var networkService: TransactionsAPIProtocol!
    
    override func setUpWithError() throws {
        self.networkService = TransactionsAPI()
    }

    override func tearDownWithError() throws {
        self.networkService = nil
    }

    func testLoadTransactions() throws {
        networkService.loadTransactions { result in
            switch result {
            case .success(let transactions):
                XCTAssert(transactions.count == 45)
            case .failure(let error):
                XCTAssert(error == .randomError)
            }
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
