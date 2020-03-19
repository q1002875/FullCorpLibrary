//
//  Character_extension.swift
//  FullSmartLife
//
//  Created by Kevin on 2018/10/25.
//  Copyright © 2018 FULL CORP. All rights reserved.
//

import Foundation

extension Character {
    var asciiValue: UInt32? {
        return String(self).unicodeScalars.filter{$0.isASCII}.first?.value
    }
}
