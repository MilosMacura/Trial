//
//  DateFormatter.swift
//  Trial
//
//  Created by Milos on 7/2/20.
//

import Foundation

extension DateFormatter {
    static var shortDateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter
    }
}
