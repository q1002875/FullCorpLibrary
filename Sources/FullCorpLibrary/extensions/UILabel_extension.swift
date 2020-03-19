//
//  UILabel_extension.swift
//  FullSmartLife
//
//  Created by Luke on 2019/7/15.
//  Copyright © 2019 FULL CORP. All rights reserved.
//

import UIKit

extension UILabel {
    
    static func make(_ title: String, color: UIColor = .white, fontSize: CGFloat = 17, fontWeight: UIFont.Weight = .regular, numberOfLines: Int = 1, lineBreakMode: NSLineBreakMode = .byTruncatingTail, textAlignment: NSTextAlignment = .left) -> UILabel {
        let lbl = UILabel()
        lbl.text = title
        lbl.textColor = color
        lbl.font = .systemFont(ofSize: fontSize, weight: fontWeight)
        lbl.numberOfLines = numberOfLines
        lbl.lineBreakMode = lineBreakMode
        lbl.textAlignment = textAlignment
        return lbl
    }
    
    var currentNumberOfLines: Int {
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(Float.infinity))
        let charSize = font.lineHeight
        let text = (self.text ?? "") as NSString
        let textSize = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [.font: font ?? .systemFont(ofSize: 17)], context: nil)
        let linesRoundedUp = Int(ceil(textSize.height/charSize))
        return linesRoundedUp
    }
    
    
    
    @IBInspectable var isShadowOnText: Bool {
        get {
            return self.isShadowOnText
        }
        set {
            
            if newValue == false{
                
                self.layer.shadowColor = UIColor.black.cgColor
                self.layer.shadowRadius = 1.0
                self.layer.shadowOpacity = 0.5
                self.layer.shadowOffset = CGSize(width: 1, height: 1)
                self.layer.masksToBounds = false
            }else{
                self.layer.shadowColor = UIColor.white.cgColor
                self.layer.shadowRadius = 0
                self.layer.shadowOpacity = 0
                self.layer.shadowOffset = CGSize(width: 0, height: 0)
                self.layer.masksToBounds = false
            }
        }
    }
    
    
}
