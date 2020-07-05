//
//  AppView.swift
//  Trial
//
//  Created by Milos on 6/28/20.
//

import SwiftUI

struct AppView: View {
    @ObservedObject private var state: AppState
    let interactor: AppInteractable
    
    init(state: AppState, interactor: AppInteractable) {
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
                let state = TransactionListState()
                let networkService = TransactionsAPI()
                let interactor = TransactionListInteractor(state: state,
                                                           networkService: networkService)
                TransactionListView(state: state,
                                    interactor: interactor)
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        let state = AppState()
        let interactor = AppInteractor(state: state)
        return AppView(state: state, interactor: interactor)
    }
}
