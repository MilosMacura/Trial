//
//  TransactionsAPIMock.swift
//  Trial
//
//  Created by Milos on 7/2/20.
//

import Foundation

public final class TransactionsAPIMock: TransactionsAPIProtocol {
    func loadTransactions(completion: @escaping (Result<[Transaction], APIError>) -> Void) {
        completion(JSONLoader.readTransactions(fileName: "transactions_mock"))
    }
}
