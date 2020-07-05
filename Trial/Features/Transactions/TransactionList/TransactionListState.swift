//
//  TransactionListState.swift
//  Trial
//
//  Created by Milos on 7/1/20.
//

import Combine
import Foundation

enum LoadingState {
    case loadingInProgress
    case loadingFinished
    case loadingFailed
}

class TransactionListState: ObservableObject {
    @Published var transactions = [Transaction]()
    @Published var transactionValueSum = "0.0"
    @Published var loadingState: LoadingState = .loadingInProgress
    
    private var cancellable = Set<AnyCancellable>()
    
    var transactionsSum: AnyPublisher<NSDecimalNumber, Never> {
        $transactions
            .map { transactions in
                
                transactions.reduce(NSDecimalNumber(0)) { (result: NSDecimalNumber, transaction: Transaction) -> NSDecimalNumber in
                    return result.adding(transaction.amount.decimalValue)
                }
            }
            .eraseToAnyPublisher()
    }
    
    init() {
        transactionsSum
            .map { $0.stringValue }
            .assign(to: \.transactionValueSum, on: self)
            .store(in: &cancellable)
    }
}
