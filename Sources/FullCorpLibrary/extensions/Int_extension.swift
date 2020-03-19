//
//  Int_extension.swift
//  FullSmartLife
//
//  Created by Luke on 2019/7/19.
//  Copyright © 2019 FULL CORP. All rights reserved.
//

import Foundation

extension Int {
    
    var minAndSec: String {
        let minute = String(format: "%0.2d", (self / 60) % 60)
        let sec = String(format: "%0.2d", self % 60)
        return "\(minute):\(sec)"
    }
    
    var hourAndMin: String {
        let sec = self % 60
        var min = (self / 60) % 60
        if sec > 30 {
            min += 1
        }
        let hour = self / 3600
        return String(format: "%02d:%02d", hour, min)
    }
    
    var asSelectedDeviceNumberString: String {
        return "已選取".localized + ": \(self) " + (self > 1 ? "devices".localized : "device".localized)
    }
    
    init?(_ string: String?) {
        if string != nil, let int = Int(string!) {
            self = int
        } else {
            return nil
        }
    }
}
