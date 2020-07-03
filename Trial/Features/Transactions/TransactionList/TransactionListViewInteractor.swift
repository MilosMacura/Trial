//
//  TransactionListViewInteractor.swift
//  Trial
//
//  Created by Milos on 7/1/20.
//

import Foundation
import SwiftUI

protocol TransactionListViewInteractable {
    func getTransactions()
}

class TransactionListViewInteractor: TransactionListViewInteractable {
    
    private let state: TransactionListViewState
    private let networkService: TransactionsAPIProtocol
    
    init(state: TransactionListViewState,
         networkService: TransactionsAPIProtocol) {
        self.state = state
        self.networkService = networkService
        self.getTransactions()
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
