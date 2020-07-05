//
//  TransactionAPIFailMock.swift.swift
//  TrialTests
//
//  Created by Milos on 7/5/20.
//

import Foundation

@testable import Trial
import XCTest

// swiftlint:disable implicitly_unwrapped_optional

class TransactionsAPIFailMockTests: XCTestCase {

    var networkService: TransactionsAPIProtocol!
    
    override func setUpWithError() throws {
        self.networkService = TransactionsAPIFailMock()
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
