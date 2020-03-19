//
//  UIBarButtonItem_extension.swift
//  FullSmartLife
//
//  Created by Luke on 2019/7/13.
//  Copyright © 2019 FULL CORP. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    static func menuButton(_ target: UIViewController, action: Selector) -> UIBarButtonItem {
        return UIBarButtonItem(
            image: UIImage.global.gateway.image?.withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: target,
            action: action
        )
    }
    
    static func easyModeButton(_ target: UIViewController, action: Selector) -> UIBarButtonItem {
        let button = UIButton()
        button.setImage(UIImage.global.easyModeOff.image, for: .normal)
        button.setImage(UIImage.global.easyModeOn.image, for: .selected)
        button.addTarget(target, action: action, for: .touchUpInside)
        
        let easyModeButtonContainer = UIBarButtonItem(customView: button)
        easyModeButtonContainer.customView?.setConstraintOf(width: 40, height: 40)
        return easyModeButtonContainer
    }
}
