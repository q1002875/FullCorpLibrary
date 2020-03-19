//
//  UINavigationController_extension.swift
//  FullSmartLife
//
//  Created by Kevin on 2018/10/30.
//  Copyright © 2018 FULL CORP. All rights reserved.
//

import UIKit

extension UINavigationController {
    open override var childForStatusBarStyle: UIViewController? {
        return visibleViewController
    }
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}
