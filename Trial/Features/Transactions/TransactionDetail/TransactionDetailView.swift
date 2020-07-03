//
//  TransactionDetailView.swift
//  Trial
//
//  Created by Milos on 7/3/20.
//

import SwiftUI

struct TransactionDetailView: View {
    @ObservedObject var state: TransactionDetailViewState
    private let interactor: TransactionDetailViewInteractable
    
    init(state: TransactionDetailViewState,
         interactor: TransactionDetailViewInteractable) {
        self.state = state
        self.interactor = interactor
    }
    
    var body: some View {
        VStack {
            Image(systemName: TransactionHelper.imageForType(state.transaction.txType))
                .font(.largeTitle)
            Text(state.transaction.title)
                .font(.largeTitle)
            Text(state.transaction.subtitle ?? "")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
        }
        .navigationBarTitle(Text("Amount" + ": " + state.transaction.amount.decimalValue.stringValue), displayMode: .large)
        .padding()
    }
}
