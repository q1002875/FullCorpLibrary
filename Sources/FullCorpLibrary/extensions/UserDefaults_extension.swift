//
//  UserDefaults_extension.swift
//  FullSmartLife
//
//  Created by Luke on 2019/8/26.
//  Copyright © 2019 FULL CORP. All rights reserved.
//

import Foundation
extension UserDefaults {
    
    enum Key: String {
        case godMode                = "godMode"
        case previousGatewayMac     = "previousGatewayMac"
        case easyMode               = "EasyMode"
        case dbVersion              = "dbVersion"
    }
    
    func set(_ value: Any?, forKey key: Key) {
        set(value, forKey: key.rawValue)
    }
    func value(forKey key: Key) -> Any? {
        return value(forKey: key.rawValue)
    }
    func removeObject(forKey key: Key) {
        return removeObject(forKey: key.rawValue)
    }
}
