//
//  TransactionDetailState.swift
//  Trial
//
//  Created by Milos on 7/3/20.
//

import Foundation

class TransactionDetailState: ObservableObject {
    @Published var transaction: Transaction
    
    init(transaction: Transaction) {
        self.transaction = transaction
    }
}
