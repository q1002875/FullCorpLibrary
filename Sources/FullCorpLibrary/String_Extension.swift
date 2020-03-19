//
//  String_Extension.swift
//  FullSmartLife
//
//  Created by Ziv on 2016/7/13.
//  Copyright © 2016年 Ziv. All rights reserved.
//

import UIKit

extension String  {
    
    
    /** 取得macAddress 後4碼 */
    var shortMac: String {
        count >= 4 ? String(suffix(4)) : ""
    }
    
    var asciiArray: [UInt32] {
        return unicodeScalars.filter{$0.isASCII}.map{$0.value}
    }

    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func localized(with args : CVarArg...) -> String {
        return String(format: self.localized, locale: .current, arguments: args)
    }
    
    func swap(a: Character, b: Character) -> String {
        return String(self.map{
            if $0 == a {
                return b
            } else if $0 == b {
                return a
            } else {
                return $0
            }
        })
    }
    
    var andOneValue: Bool? {
        guard let uintValue = UInt16(self) else { return nil }
        return uintValue & UInt16(1) == 1
    }
    
    var hexToDouble: Double? {
        if let int = Int(self, radix: 16) {
            return Double(int)
        } else {
            return nil
        }
    }
    
    var image: UIImage? {
        return UIImage(named: self)
    }
    
    var responseSet: String {
        switch self {
        case "device_setMobileToken":       return self
        case "device_get_irRepeater":       return self + "_response"
        default:                            return self + "_Response"
        }
    }
    
    func code(start: Int, end: Int) -> String {
        guard
            end > start,
            start >= 0 && end <= count else { return "" }
        return String(self[index(startIndex, offsetBy: start) ..< index(startIndex, offsetBy: end)])
    }
}


//emojiToImage 字串轉成圖片
extension String {
    func emojiToImage() -> UIImage? {
        let size = CGSize(width: 35, height: 35)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIColor.clear.set()
        let rect = CGRect(origin: CGPoint(), size: size)
        UIRectFill(CGRect(origin: CGPoint(), size: size))
        (self as NSString).draw(in: rect, withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30)])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
