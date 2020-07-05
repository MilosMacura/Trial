//
//  TransactionList.swift
//  Trial
//
//  Created by Milos on 6/26/20.
//

import SwiftUI

struct TransactionListView: View {
    
    @ObservedObject private var state: TransactionListState
    private var interactor: TransactionListInteractable
    
    init(state: TransactionListState,
         interactor: TransactionListInteractable) {
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
                        let state = TransactionDetailState(transaction: transaction)
                        let interactor = TransactionDetailInteractor(state: state)
                        
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
        let state = TransactionListState()
        let networkService = TransactionsAPIMock()
        let interactor = TransactionListInteractor(state: state,
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
