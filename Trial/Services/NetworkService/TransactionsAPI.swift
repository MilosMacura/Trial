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
                completion(self.readTransactions())
            }
        }
    }
    
    private func readTransactions() -> Result<[Transaction], APIError> {
        guard let file = Bundle(for: TransactionsAPI.self).path(forResource: "transactions", ofType: "json") else {
            return .failure(.fileMissingError)
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: file), options: [])
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .millisecondsSince1970
            let transactionResponse = try decoder.decode(TransactionResponse.self, from: data)
            return .success(transactionResponse.collection)
        } catch let error {
            assertionFailure("Got error \(error) while parsing transactions.")
            return .failure(.parsingError)
        }
    }
}
