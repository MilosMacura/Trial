//
//  JSONLoaderTests.swift
//  TrialTests
//
//  Created by Milos on 7/5/20.
//

@testable import Trial
import XCTest

class JSONLoaderTests: XCTestCase {

    func testReadTransactionsSuccess() {
        let result: Result<TransactionResponse, APIError> = JSONLoader.loadJson(fileName: "transactions")
        switch result {
        case .success(let transactionResponse):
            XCTAssert(transactionResponse.collection.count == 45)
        case .failure(let error):
            XCTAssert(error == .randomError)
        }
    }
    
    func testReadTransactionsMockSuccess() {
        let result: Result<TransactionResponse, APIError> = JSONLoader.loadJson(fileName: "transactions_mock")
        switch result {
        case .success(let transactionResponse):
            XCTAssert(transactionResponse.collection.count == 3)
        case .failure(let error):
            XCTAssert(error == .randomError)
        }
    }
    
    func testReadTransactionsWrongFileName() {
        let result: Result<TransactionResponse, APIError> = JSONLoader.loadJson(fileName: "this_file_doesnt_exist")
        switch result {
        case .failure(let error):
            XCTAssert(error == .fileMissingError)
        case .success(let transactionResponse):
            XCTFail(transactionResponse.collection.debugDescription)
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
