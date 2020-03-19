//
//  Double_extension.swift
//  FullSmartLife
//
//  Created by Luke on 2019/6/25.
//  Copyright © 2019 FULL CORP. All rights reserved.
//

import Foundation

extension Double {
    /** Add delimiter and clear dot zero if it is actually an integer. Otherwise limit digit after dot */
    func delimiter(maxDigitAfterDot digit: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = digit
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
