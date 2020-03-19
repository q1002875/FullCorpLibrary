//
//  CAShapeLayer_extension.swift
//  FullSmartLife
//
//  Created by Luke on 2019/8/7.
//  Copyright © 2019 FULL CORP. All rights reserved.
//

import Foundation

extension CAShapeLayer {
    static func dashBorder(color: UIColor, lineWidth: CGFloat, frame: CGRect, lineDashPattern: [NSNumber] = [2, 2]) -> CAShapeLayer {
        let viewBorder = CAShapeLayer()
        viewBorder.strokeColor = color.cgColor
        viewBorder.lineDashPattern = lineDashPattern
        viewBorder.frame = frame
        viewBorder.fillColor = nil
        viewBorder.path = UIBezierPath(rect: frame).cgPath
        viewBorder.lineWidth = lineWidth
        viewBorder.lineJoin = .round
        viewBorder.lineCap = .round
        return viewBorder
    }
}
