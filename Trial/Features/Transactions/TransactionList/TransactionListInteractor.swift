//
//  TransactionListInteractor.swift
//  Trial
//
//  Created by Milos on 7/1/20.
//

import Foundation
import SwiftUI

protocol TransactionListInteractable {
    func getTransactions()
}

class TransactionListInteractor: TransactionListInteractable {
    
    private let state: TransactionListState
    private let networkService: TransactionsAPIProtocol
    
    init(state: TransactionListState,
         networkService: TransactionsAPIProtocol) {
        self.state = state
        self.networkService = networkService
    }
    
    //TODO: fix animations on loading end
    func getTransactions() {
        state.loadingState = .loadingInProgress
        networkService.loadTransactions { result in
            switch result {
            case .failure(let error):
                print(error)
                withAnimation {
                    self.state.loadingState = .loadingFailed
                }
            case .success(let transactions):
                print(transactions)
                self.state.transactions = transactions
                withAnimation {
                    self.state.loadingState = .loadingFinished
                }
            }
        }
    }
}
