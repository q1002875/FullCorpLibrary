//
//  UIApplication_extension.swift
//  FullSmartLife
//
//  Created by Luke on 2019/8/20.
//  Copyright © 2019 FULL CORP. All rights reserved.
//

import Foundation

extension UIApplication {
    var firstResponder: UIResponder? {
        var _firstResponder: UIResponder?
        
        let reportAsFirstHandler = { (responder: UIResponder) -> Void in
            _firstResponder = responder
        }
        
        sendAction(#selector(UIResponder.reportAsFirst), to: nil, from: reportAsFirstHandler, for: nil)
        
        return _firstResponder
    }
    
    var statusBarView: UIView? {
        if #available(iOS 13.0, *) {
            let tag = 54068 //38482458385
            if let statusBar = self.keyWindow?.viewWithTag(tag) {
                return statusBar
            } else {
                let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
                statusBarView.tag = tag

                self.keyWindow?.addSubview(statusBarView)
                return statusBarView
            }
        } else {
            if responds(to: Selector(("statusBar"))) {
                return value(forKey: "statusBar") as? UIView
            }
        }
        return nil
    }
    
}

