//
//  UInt16_extension.swift
//  FullSmartLife
//
//  Created by Luke on 2019/8/27.
//  Copyright © 2019 FULL CORP. All rights reserved.
//

import Foundation

extension UInt16 {
    var andOne: Bool {
        return (UInt16(1) & self) == 1
    }
}
