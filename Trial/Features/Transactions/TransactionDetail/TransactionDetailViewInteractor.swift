//
//  TransactionDetailInteractor.swift
//  Trial
//
//  Created by Milos on 7/3/20.
//

import Foundation

protocol TransactionDetailViewInteractable {
    
}

class TransactionDetailViewInteractor: TransactionDetailViewInteractable {
    private let state: TransactionDetailViewState
    
    init(state: TransactionDetailViewState) {
        self.state = state
    }
}
