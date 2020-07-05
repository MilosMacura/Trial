//
//  TransactionAPIFailMock.swift
//  Trial
//
//  Created by Milos on 7/5/20.
//

import Foundation

public final class TransactionsAPIFailMock: TransactionsAPIProtocol {
    func loadTransactions(completion: @escaping (Result<[Transaction], APIError>) -> Void) {
        completion(.failure(.randomError))
    }
}
