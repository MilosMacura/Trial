//
//  TransactionListItem.swift
//  Trial
//
//  Created by Milos on 7/3/20.
//

import SwiftUI

struct TransactionListItem: View {
    @ScaledMetric var iconCircleSize: CGFloat = 40
    var amountColor: Color {
        switch Double(truncating: transaction.amount.decimalValue) {
        case 0:
            return Color.clear
        case let amount where amount < 0:
            return Color.black
        case let amount where amount > 0:
            return Color.green
        default:
            return Color.black
        }
    }
    
    let transaction: Transaction
    let interactor: TransactionListViewInteractable
    
    var body: some View {
        HStack {
            VStack {
                ZStack {
                    Circle()
                        .stroke(lineWidth: 1.0)
                        .foregroundColor(.pleasantLightGray)
                        .frame(width: self.iconCircleSize, height: self.iconCircleSize, alignment: .center)
                    Image(systemName: TransactionHelper.imageForType(transaction.txType))
                        .foregroundColor(.pleasantGray)
                        .padding()
                }
                Spacer()
            }
            .padding(.trailing, 5)
            
            VStack(alignment: .leading) {
                Text("\(transaction.bookingDate, formatter: DateFormatter.shortDateFormatter)")
                    .font(.caption2)
                    .foregroundColor(.gray)
                Text(transaction.title)
                    .font(.callout)
                Text(transaction.subtitle ?? "")
                    .font(.caption)
                Text(transaction.additionalTexts.lineItems.joined(separator: " "))
                    .font(.caption2)
                    .foregroundColor(.gray)
                HStack {
                    Spacer()
                    Text(transaction.amount.decimalValue.stringValue + " " + transaction.amount.currency)
                        .foregroundColor(amountColor)
                }
            }
        }
        .padding()
    }
}
