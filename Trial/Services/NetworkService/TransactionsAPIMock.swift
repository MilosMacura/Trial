//
//  TransactionsAPIMock.swift
//  Trial
//
//  Created by Milos on 7/2/20.
//

import Foundation

public final class TransactionsAPIMock: TransactionsAPIProtocol {
    func loadTransactions(completion: @escaping (Result<[Transaction], APIError>) -> Void) {
        
        let result: Result<TransactionResponse, APIError> = JSONLoader.loadJson(fileName: "transactions_mock")
        
        switch result {
        case .success(let transactionResponse):
            completion(.success(transactionResponse.collection))
        case .failure(let error):
            completion(.failure(error))
        }
    }
}
