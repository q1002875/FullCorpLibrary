//
//  UIColorExtension.swift
//  FullSmartLife
//
//  Created by Ziv on 2016/6/29.
//  Copyright © 2016年 Ziv. All rights reserved.
//

import UIKit

extension UIColor {
    //字體顏色height light深黃   #003377深綠
//    static let oldhighlight = UIColor(hexString: "FCECA4") ?? .yellow
//    static let highlight = UIColor(hexString: "FCECA4") ?? .yellow
    
    
    static let oldhighlight = UIColor(hexString: "14325C") ?? .yellow
    static let highlight = UIColor(hexString: "14325C") ?? .yellow
    
    
    
    static let rowLightBackground = UIColor(hexString: "227C7C")!    //2dc89a //3BC8B0
    static let rowDarkBackground = UIColor(hexString: "1E4C59")!     //22b287 //3BACCA
    static let sectionColor = UIColor(hexString: "1E4C59")!
    static let switchTintColor = UIColor(hexString: "FF7532")!
    static let scheduleButtonColor = UIColor(hexString: "0CD4C8")!
    static let automationButtonColor = UIColor(hexString: "2CE88E")!
    static let groupButtonColor =  UIColor(hexString: "79DDF8")!
    static let passwordGrey = UIColor(hexString: "BBBBBB")!
    static let darkHeader = UIColor(hexString: "003333")!
    static let lightTitle = UIColor(hexString: "BBEEBB")!
    static let greenForSafe = UIColor(hexString: "239748")!
    static let redForDangerous = UIColor(hexString: "E11220")!
    static let menuBackground = UIColor(hexString: "222D31")!
    static let guidingStepTextColor = UIColor(hexString: "555555")!
    static let stepDescriptionBackground = UIColor(hexString: "D1D8BC")!
    static let guidedTableViewControllerBackground = UIColor(hexString: "EFEFF4")!
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
    convenience init?(hexString: String) {
        var hexSanitized = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0

        let length = hexSanitized.count

        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }

        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0

        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0

        } else {
            return nil
        }

        self.init(red: r, green: g, blue: b, alpha: a)
    }

    

    //MARK: - From UIColor to String
    var hexString: String? { hexString() }
    
    func hexString(alpha: Bool = false, withPoundSign: Bool = true) -> String? {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alphaValue: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alphaValue)
        
        func transform(_ value: CGFloat) -> Int {
            lroundf(Float(value * 255))
        }
        let formatPrefix = withPoundSign ? "#" : ""
        if alpha {
            return String(format: formatPrefix + "%02lX%02lX%02lX%02lX", transform(red), transform(green), transform(blue), transform(alphaValue))
        } else {
            return String(format: formatPrefix + "%02lX%02lX%02lX", transform(red), transform(green), transform(blue))
        }
    }
    
    //MARK: - From UIColor to hsv
    var hsv: (hue: CGFloat, saturation: CGFloat, brightness: CGFloat) {
        
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let red = r
        let green = g
        let blue = b
        
        var hue: CGFloat = 0;
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        
        let minRGB: CGFloat = min(red, min(green, blue))
        let maxRGB: CGFloat = max(red, max(green, blue))
        
        if (minRGB == maxRGB) {
            hue = 0
            saturation = 0
            brightness = minRGB
            
        } else {
            let d: CGFloat = (red == minRGB) ? green - blue : ((blue == minRGB) ? red - green : blue - red)
            let h: CGFloat = (red == minRGB) ? 3 : ((blue == minRGB) ? 1 : 5)
            hue = (h - d/(maxRGB - minRGB)) / 6.0
            saturation = (maxRGB - minRGB) / maxRGB
            brightness = maxRGB
        }
        
        return (hue, saturation, brightness)
    }
    
    //MARK: - Brightness Contrasting Color
    var contrastingBlackOrWhite: UIColor { contrastingWithColor(lightColor: .white, darkColor: .black) }
    func contrastingWithColor(lightColor: UIColor, darkColor: UIColor) -> UIColor {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let isLight = (r * 0.299 + g * 0.587 + b * 0.114) * 255 > 186
        return isLight ? darkColor : lightColor
    }
}
