//
//  BootService.swift
//  Trial
//
//  Created by Milos on 6/26/20.
//

import Foundation
import SwiftUI

protocol AppInteractable {
    func showTransactionList()
}

class AppInteractor: AppInteractable {
    
    private let state: AppState
    
    init(state: AppState) {
        self.state = state
        
            if state.isFirstRun {
                self.state.activeViewType = .tourView
                state.isFirstRun = false
            } else {
                self.state.activeViewType = .transactionScreen
            }
    }
    
    func showTransactionList() {
        withAnimation {
            self.state.activeViewType = .transactionScreen
        }
    }
}
