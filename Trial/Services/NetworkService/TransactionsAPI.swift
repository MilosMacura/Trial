//
//  TransactionsAPI.swift
//  Trial
//
//  Created by Stefan Rinner on 12.02.18.
//  Copyright © 2018 BeeOne Gmbh. All rights reserved.
//

import Foundation

protocol TransactionsAPIProtocol {
    func loadTransactions(completion: @escaping (Result<[Transaction], APIError>) -> Void)
}

public final class TransactionsAPI: TransactionsAPIProtocol {

    /// Loads a list of transaction - you can assume that all transactions have the same currency
    public func loadTransactions(completion: @escaping (Result<[Transaction], APIError>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + Double.random(in: 0...5000) / 1000.0) {
            switch Int.random(in: 0...100) {
            case 0..<25:
                completion(.failure(.randomError))
            default:
                
                let result: Result<TransactionResponse, APIError> = JSONLoader.loadJson(fileName: "transactions")
                
                switch result {
                case .success(let transactionResponse):
                    completion(.success(transactionResponse.collection))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }

}
