//
//  LayoutGuideProvider.swift
//  FullSmartLife
//
//  Created by Luke on 2019/9/9.
//  Copyright © 2019 FULL CORP. All rights reserved.
//

import Foundation

protocol LayoutGuideProvider {
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var leftAnchor: NSLayoutXAxisAnchor { get }
    var rightAnchor: NSLayoutXAxisAnchor { get }
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var widthAnchor: NSLayoutDimension { get }
    var heightAnchor: NSLayoutDimension { get }
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }
}

extension UIView: LayoutGuideProvider { }
extension UILayoutGuide: LayoutGuideProvider { }
