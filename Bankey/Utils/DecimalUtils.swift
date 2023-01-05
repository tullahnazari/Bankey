//
//  DecimalUtils.swift
//  Bankey
//
//  Created by tullah nazari on 1/5/23.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal:self).doubleValue
    }
}
