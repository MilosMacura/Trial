//
//  TransactionHelpers.swift
//  Trial
//
//  Created by Milos on 7/3/20.
//

import SwiftUI

class TransactionHelper {
    static func imageForType(_ type: String) -> String {
        switch type {
        case "CASHCOLLECTION":
            return "banknote"
        case "POSPAYMENT":
            return "creditcard"
        case "MANUAL":
            return "signature"
        case "BANKINFO":
            return "info"
        case "OTHER":
            return "plus"
        default:
            return "mail"
        }
    }
    
    static func amountColor(value: NSDecimalNumber) -> Color {
        switch Double(truncating: value) {
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
}
