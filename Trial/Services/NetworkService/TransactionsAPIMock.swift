//
//  TransactionsAPIMock.swift
//  Trial
//
//  Created by Milos on 7/2/20.
//

import Foundation

// swiftlint:disable force_unwrapping

public final class TransactionsAPIMock: TransactionsAPIProtocol {
    func loadTransactions(completion: @escaping (Result<[Transaction], APIError>) -> Void) {
        let file = Bundle(for: TransactionsAPI.self).path(forResource: "transactions", ofType: "json")!
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: file), options: [])
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .millisecondsSince1970
            let transactionResponse = try decoder.decode(TransactionResponse.self, from: data)
            completion(.success(transactionResponse.collection))
        } catch let error {
            assertionFailure("Got error \(error) while parsing transactions.")
            completion(.failure(.parsingError))
        }
    }
}
