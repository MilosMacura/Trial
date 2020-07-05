//
//  TransactionsAPIMockTests.swift
//  TrialTests
//
//  Created by Milos on 7/5/20.
//

@testable import Trial
import XCTest

// swiftlint:disable implicitly_unwrapped_optional

class TransactionsAPIMockTests: XCTestCase {

    var networkService: TransactionsAPIProtocol!
    
    override func setUpWithError() throws {
        self.networkService = TransactionsAPIMock()
    }

    override func tearDownWithError() throws {
        self.networkService = nil
    }

    func testMockNetworkService() throws {
        networkService.loadTransactions { result in
            switch result {
            case .success(let transactions):
                XCTAssert(transactions.count == 3)
            case .failure(let error):
                XCTAssert(error == .randomError)
            }
        }
    }
}
