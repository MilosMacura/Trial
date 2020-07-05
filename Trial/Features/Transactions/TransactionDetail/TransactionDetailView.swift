//
//  TransactionDetailView.swift
//  Trial
//
//  Created by Milos on 7/3/20.
//

import SwiftUI

struct TransactionDetailView: View {
    @ObservedObject var state: TransactionDetailState
    private let interactor: TransactionDetailInteractable
    
    init(state: TransactionDetailState,
         interactor: TransactionDetailInteractable) {
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

struct TransactionDetailView_Previews: PreviewProvider {
    
    //swiftlint:disable force_unwrapping
    
    static var previews: some View {
        
        var transaction: Trial.Transaction?
        
        let transactionsResult = JSONLoader.readTransactions(fileName: "transactions_mock")
        switch transactionsResult {
        case .success(let transactions):
            transaction = transactions[0]
        default:
            transaction = nil
        }
        
        let state = TransactionDetailState(transaction: transaction!)
        let interactor = TransactionDetailInteractor(state: state)
        
        return TransactionDetailView(state: state, interactor: interactor)
    }
}
