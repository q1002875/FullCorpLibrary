//
//  StringProtocol_Extensions.swift
//  FullSmartLife
//
//  Created by Kevin on 2018/12/12.
//  Copyright © 2018 FULL CORP. All rights reserved.
//

import Foundation

extension StringProtocol {
    var double: Double? {
        return Double(self)
    }
    var float: Float? {
        return Float(self)
    }
    var integer: Int? {
        return Int(self)
    }
}
