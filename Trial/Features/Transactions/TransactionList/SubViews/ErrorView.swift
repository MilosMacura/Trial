//
//  ErrorView.swift
//  Trial
//
//  Created by Milos on 7/3/20.
//

import SwiftUI

struct ErrorView: View {
    let interactor: TransactionListInteractable
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "xmark.octagon")
                .font(.largeTitle)
            Text("The odds are against you, something went wrong.")
            Spacer()
            Button(action: {
                interactor.getTransactions()
            }) {
                HStack {
                    Image(systemName: "checkmark")
                    Text("Let's try again!")
                }
            }
            .buttonStyle(BouncyButtonStyle())
        }
    }
}
