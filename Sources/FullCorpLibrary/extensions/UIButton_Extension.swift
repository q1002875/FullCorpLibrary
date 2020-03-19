//
//  UIButton_Extension.swift
//  FullSmartLife
//
//  Created by Luke on 2018/12/10.
//  Copyright © 2018 FULL CORP. All rights reserved.
//

import UIKit

extension UIButton {
    
    /** create single color image */
    private func image(withColor color: UIColor, frame: CGRect = CGRect(x: 0, y: 0, width: 1, height: 1)) -> UIImage? {
        UIGraphicsBeginImageContext(frame.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(frame)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    func rotate360DegreeWithAnimation(round: Int, duration: TimeInterval) {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = CGFloat(.pi * 2 * CGFloat(round))
        rotationAnimation.duration = duration
        self.layer.add(rotationAnimation, forKey: nil)
    }

    static func checkbox(_ target: Any?, action: Selector) -> UIButton {
        let btn = UIButton()
        btn.setImage(UIImage.global.choose.image, for: .selected)
        btn.setImage(UIImage.global.notChoose.image, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(target, action: action, for: .touchUpInside)
        return btn
    }
    enum ButtonStyle {
        case checkbox
    }
    
    convenience init(buttonStyle: ButtonStyle, target: Any?, action: Selector) {
        self.init()
        setImage(UIImage.global.choose.image, for: .selected)
        setImage(UIImage.global.notChoose.image, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(target, action: action, for: .touchUpInside)
    }
}
