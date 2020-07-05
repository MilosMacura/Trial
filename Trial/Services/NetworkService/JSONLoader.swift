//
//  JsonLoader.swift
//  Trial
//
//  Created by Milos on 7/5/20.
//

import Foundation

class JSONLoader {
    static func readTransactions(fileName: String) -> Result<[Transaction], APIError> {
        guard let file = Bundle(for: TransactionsAPI.self).path(forResource: fileName, ofType: "json") else {
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
