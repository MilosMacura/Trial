//
//  TransactionDetailInteractor.swift
//  Trial
//
//  Created by Milos on 7/3/20.
//

import Foundation

protocol TransactionDetailInteractable {
    
}

class TransactionDetailInteractor: TransactionDetailInteractable {
    private let state: TransactionDetailState
    
    init(state: TransactionDetailState) {
        self.state = state
    }
}
