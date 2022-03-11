//
//  Int+Extension.swift
//  Getaround
//
//  Created by Birkyboy on 11/03/2022.
//

import Foundation

extension Int {
    func convertToCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 0

        let number = NSNumber(value: self)
        return formatter.string(from: number)!
    }
}
