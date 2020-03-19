//
//  Float_extension.swift
//  FullSmartLife
//
//  Created by Luke on 2019/6/21.
//  Copyright © 2019 FULL CORP. All rights reserved.
//

import Foundation

extension Float {
    /** Add delimiter and clear dot zero if it is actually an integer. Otherwise limit digit after dot */
    func delimiter(maxDigitAfterDot digit: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = digit
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
