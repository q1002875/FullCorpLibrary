//
//  UIStackView_extension.swift
//  FullSmartLife
//
//  Created by Luke on 2019/6/20.
//  Copyright © 2019 FULL CORP. All rights reserved.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach{ addArrangedSubview($0) }
    }
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach{ addArrangedSubview($0) }
    }
    func removeArrangedSubviews(_ views: UIView...){
        views.forEach{ removeArrangedSubview($0) }
        views.forEach{ $0.removeFromSuperview() }
    }
    func reset() {
        arrangedSubviews.forEach {
            removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
    
    func equalizeWidthOrHeightOfSubview<Subview: UIView>(_ type: Subview.Type) {
        var firstViewOfType: Subview? = nil
        for subview in arrangedSubviews where subview is Subview {
            if firstViewOfType == nil {
                firstViewOfType = subview as? Subview
            } else {
                if axis == .horizontal {
                    subview.widthAnchor.constraint(equalTo: firstViewOfType!.widthAnchor).isActive = true
                } else if axis == .vertical {
                    subview.heightAnchor.constraint(equalTo: firstViewOfType!.heightAnchor).isActive = true
                }
            }
        }
    }
    
    func fillAlignmentOfSubviewType<Subview: UIView>(_ type: Subview.Type, multiplier: CGFloat = 1) {
        for subview in arrangedSubviews where subview is Subview {
            switch axis {
            case .horizontal:
                subview.heightAnchor.constraint(equalTo: heightAnchor, multiplier: multiplier).isActive = true
            case .vertical:
                subview.widthAnchor.constraint(equalTo: widthAnchor, multiplier: multiplier).isActive = true
            @unknown default:
                fatalError("Unknown axis")
            }
        }
    }
}
