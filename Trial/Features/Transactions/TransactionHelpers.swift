//
//  TransactionHelpers.swift
//  Trial
//
//  Created by Milos on 7/3/20.
//

import Foundation
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
}
