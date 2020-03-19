//
//  TimeInterval_extension.swift
//  FullSmartLife
//
//  Created by Luke on 2019/8/20.
//  Copyright © 2019 FULL CORP. All rights reserved.
//

import Foundation

extension TimeInterval {
    var hourMinTupple: (hour: Int, min: Int){
        let timeInt = NSInteger(self)
        let hour = (timeInt / 3600)
        let min = (timeInt / 60) % 60
        return (hour, min)
    }
    
    var hourMinString: String {
        guard self >= 0 else { return "--:--"}
        let ti = Int(self)
        var hour = (ti / 3600) % 24
        let min = (ti / 60) % 60
        let trailingText = hour >= 12 ? " PM" : " AM"
        hour = hour > 12 ? hour - 12 : hour
        return String(format: "%02d:%02d", hour, min) + trailingText
    }
    
    var twentyFourString: String {
           guard self >= 0 else { return "--:--"}
           let ti = Int(self)
           var hour = (ti / 3600) % 24
           let min = (ti / 60) % 60
//           let trailingText = hour >= 12 ? " PM" : " AM"
//           hour = hour > 12 ? hour - 12 : hour
           return String(format: "%02d:%02d", hour, min) 
       }
    
}
