//
//  UIResponder_extension.swift
//  FullSmartLife
//
//  Created by Luke on 2019/8/20.
//  Copyright © 2019 FULL CORP. All rights reserved.
//

import Foundation

extension UIResponder {
    @objc func reportAsFirst(_ sender: Any) {
        if let handler = sender as? (UIResponder) -> Void {
            handler(self)
        }
    }
}
