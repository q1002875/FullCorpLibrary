//
//  NSDate_extension.swift
//  FullSmartLife
//
//  Created by Luke on 2019/7/12.
//  Copyright © 2019 FULL CORP. All rights reserved.
//

import Foundation

extension NSDate {
    var string: String {
        return (self as Date).string
    }
    func isEarlierThan(secondsAgo seconds: TimeInterval) -> Bool {
        return self.timeIntervalSinceNow < -seconds
    }
}
