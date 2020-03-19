//
//  UITextField_extension.swift
//  FullSmartLife
//
//  Created by Luke on 2019/8/7.
//  Copyright © 2019 FULL CORP. All rights reserved.
//

import UIKit

extension UITextField {
    var containsText: Bool {
        return !(text?.isEmpty ?? true)
    }
    
    var textCount: Int {
        return text?.count ?? 0
    }
    
    func textCount(equalTo target: Int) -> Bool {
        return textCount == target
    }
    
    func textCount(inRange range: Range<Int>) -> Bool {
        return range ~= textCount
    }
}
