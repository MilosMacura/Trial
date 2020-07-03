//
//  TransactionList.swift
//  Trial
//
//  Created by Milos on 6/26/20.
//

import SwiftUI

struct TransactionListView: View {
    
    @ObservedObject private var state: TransactionListViewState
    private var interactor: TransactionListViewInteractable
    
    init(state: TransactionListViewState,
         interactor: TransactionListViewInteractable) {
        self.state = state
        self.interactor = interactor
    }
    
    var body: some View {
        VStack {
            switch state.loadingState {
            case .loadingInProgress:
                LoadingView()
                
            case .loadingFinished:
                NavigationView {
                    List(state.transactions) { transaction in
                        let state = TransactionDetailViewState(transaction: transaction)
                        let interactor = TransactionDetailViewInteractor(state: state)
                        
                        NavigationLink(destination: TransactionDetailView(state: state,
                                                                          interactor: interactor)) {
                            TransactionListItem(transaction: transaction,
                                                interactor: self.interactor)
                        }
                    }
                    .navigationBarTitle(Text("Balance" + ": " + state.transactionValueSum), displayMode: .large)
                }
                
            case .loadingFailed:
                ErrorView(interactor: self.interactor)
            }
        }
    }
}

struct TransactionList_Previews: PreviewProvider {
    static var previews: some View {
        let state = TransactionListViewState()
        let networkService = TransactionsAPIMock()
        let interactor = TransactionListViewInteractor(state: state,
                                                       networkService: networkService)
        return Group {
            TransactionListView(state: state,
                                interactor: interactor)
                .environment(\.sizeCategory, .medium)
            TransactionListView(state: state,
                                interactor: interactor)
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .medium)
        }
    }
}
