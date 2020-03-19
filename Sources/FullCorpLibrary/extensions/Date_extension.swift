//
//  Date_extension.swift
//  FullSmartLife
//
//  Created by Luke on 2019/7/12.
//  Copyright © 2019 FULL CORP. All rights reserved.
//

import Foundation


extension Date {
    var string: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd@HH:mm:ss"
        let strDate = dateFormatter.string(from: self)
        return strDate
    }
    
    func isEarlierThan(secondsAgo seconds: TimeInterval) -> Bool {
        return self.timeIntervalSinceNow < -seconds
    }
}
