//
//  RootView.swift
//  Trial
//
//  Created by Milos on 6/28/20.
//

import SwiftUI

struct RootView: View {
    @ObservedObject private var state: RootViewState
    let interactor: RootViewInteractable
    
    init(state: RootViewState, interactor: RootViewInteractable) {
        self.state = state
        self.interactor = interactor
    }
    
    var body: some View {
        VStack {
            switch state.activeViewType {
            case ScreenName.tourView:
                TourView(state: TourViewState(),
                         interactor: TourViewInteractor(),
                         rootViewInteractor: interactor)
            case ScreenName.transactionScreen:
                let state = TransactionListViewState()
                let interactor = TransactionListViewInteractor(state: state,
                                                               networkService: TransactionsAPI())
                TransactionListView(state: state,
                                    interactor: interactor)
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        let state = RootViewState()
        let interactor = RootViewInteractor(state: state)
        return RootView(state: state, interactor: interactor)
    }
}
