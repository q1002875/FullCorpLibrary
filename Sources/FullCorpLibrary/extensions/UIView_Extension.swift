//
//  UIView_Extension.swift
//  FullSmartLife
//
//  Created by Ziv on 2016/4/26.
//  Copyright © 2016年 Ziv. All rights reserved.
//

import UIKit
import Themes
extension UIView{

    enum FillingStyle {
        case upperLeft
        case upperCenter
        case upperRight
        case left
        case center
        case right
        case lowerLeft
        case lowerCenter
        case lowerRight
    }
    enum FourSides {
        case leading, trailing, top, bottom
    }
    
    //Utilities
    func addSubviews(_ views: UIView...) {
        views.forEach{addSubview($0)}
    }
    func addSubviews(_ views: [UIView]) {
        views.forEach{addSubview($0)}
    }
    
    class func loadFromNibNamed(nibNamed: String, bundle : Bundle? = nil) -> UIView? {
        return UINib(nibName: nibNamed, bundle: bundle).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }
    
    func copyView() -> AnyObject {
        return NSKeyedUnarchiver.unarchiveObject(with: NSKeyedArchiver.archivedData(withRootObject: self))! as AnyObject
    }
    
    func hasSameAncestor(with view: UIView) -> Bool {
        var tempView: UIView? = self
        while tempView != nil && !view.isDescendant(of: tempView!) {
            tempView = tempView?.superview
        }
        return tempView != nil
    }
    
    //extendable spacer
    static var spacer: UIView {
        let view = UIView()
        view.setContentHuggingPriority(.low100, for: .horizontal)
        view.setContentHuggingPriority(.low100, for: .vertical)
        view.setContentCompressionResistancePriority(.low100, for: .horizontal)
        view.setContentCompressionResistancePriority(.low100, for: .vertical)
        return view
    }
    
    //Separator
    static func separatorMake(_ direction: NSLayoutConstraint.Axis, thickness: CGFloat = 0.5, color: UIColor = .separatorColor) -> UIView {
        
        let view = UIView()
          
        view.backgroundColor = color
        view.translatesAutoresizingMaskIntoConstraints = false
        if direction == .horizontal {
            view.heightAnchor.constraint(equalToConstant: thickness).isActive = true
            view.setContentHuggingPriority(.high300, for: .vertical)
            view.setContentHuggingPriority(.low100, for: .horizontal)
            view.setContentCompressionResistancePriority(.high300, for: .vertical)
            view.setContentCompressionResistancePriority(.low100, for: .horizontal)
        } else if direction == .vertical {
            view.widthAnchor.constraint(equalToConstant: thickness).isActive = true
            view.setContentHuggingPriority(.high300, for: .horizontal)
            view.setContentHuggingPriority(.low100, for: .vertical)
            view.setContentCompressionResistancePriority(.high300, for: .horizontal)
            view.setContentCompressionResistancePriority(.low100, for: .vertical)
        }
        return view
    }
    
    //Animation
    func shake(count : Float = 4,for duration : TimeInterval = 0.5,withTranslation translation : Float = 5) {
        
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.repeatCount = count
        animation.duration = duration/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: CGFloat(-translation), y: center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: CGFloat(translation), y: center.y))
        layer.add(animation, forKey: "shake")
    }
    
    //Constraints
    private func setFillingStyle(_ fillingStyle: FillingStyle) {
        guard let superview = superview else { fatalError("Superview is nil") }
        switch fillingStyle {
        case .upperLeft:
            topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
            leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
        case .upperCenter:
            topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
            centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        case .upperRight:
            topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
            trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
        case .left:
            centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
            leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
        case .center:
            centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
            centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        case .right:
            centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
            trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
        case .lowerLeft:
            bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
            leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
        case .lowerCenter:
            bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
            centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        case .lowerRight:
            bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
            trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
        }
    }
    func fillSuperview(top: CGFloat = 0, bottom: CGFloat = 0, leading: CGFloat = 0, trailing: CGFloat = 0) {
        guard let superview = superview else { fatalError("Superview is nil") }
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superview.topAnchor, constant: top).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: bottom).isActive = true
        leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: leading).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: trailing).isActive = true
    }
    func fillSuperview(edgeInsets: UIEdgeInsets) {
        guard let superview = superview else { fatalError("Superview is nil") }
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superview.topAnchor, constant: edgeInsets.top).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -edgeInsets.bottom).isActive = true
        leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: edgeInsets.left).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -edgeInsets.right).isActive = true
    }
    
    func fillSuperview(horizontalRatio: CGFloat = 1, verticalRatio: CGFloat = 1, fillingStyle: FillingStyle = .center, maxWidth: CGFloat? = nil, maxHeight: CGFloat? = nil) {
        guard let superview = superview else { fatalError("Superview is nil") }
        translatesAutoresizingMaskIntoConstraints = false
        setFillingStyle(fillingStyle)
        let widthConstraint = widthAnchor.constraint(equalTo: superview.widthAnchor, multiplier: horizontalRatio)
        widthConstraint.priority = UILayoutPriority(900)
        widthConstraint.isActive = true
        let heightConstraint = heightAnchor.constraint(equalTo: superview.heightAnchor, multiplier: verticalRatio)
        heightConstraint.priority = UILayoutPriority(900)
        heightConstraint.isActive = true
        
        if maxWidth != nil {
            widthAnchor.constraint(lessThanOrEqualToConstant: maxWidth!).isActive = true
        }
        if maxHeight != nil {
            heightAnchor.constraint(lessThanOrEqualToConstant: maxHeight!).isActive = true
        }
    }
    
    func fillSafeArea(with edgeInsets: UIEdgeInsets = .zero) {
        guard let superview = superview else { fatalError("Superview is nil") }
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superview.compatibleSafeAreaLayoutGuide.topAnchor, constant: edgeInsets.top).isActive = true
        bottomAnchor.constraint(equalTo: superview.compatibleSafeAreaLayoutGuide.bottomAnchor, constant: -edgeInsets.bottom).isActive = true
        leadingAnchor.constraint(equalTo: superview.compatibleSafeAreaLayoutGuide.leadingAnchor, constant: edgeInsets.left).isActive = true
        trailingAnchor.constraint(equalTo: superview.compatibleSafeAreaLayoutGuide.trailingAnchor, constant: -edgeInsets.right).isActive = true
    }
    
    func setConstraintOf(width: CGFloat, height: CGFloat, priority: Float = 800) {
        translatesAutoresizingMaskIntoConstraints = false
        let heightConstraint = heightAnchor.constraint(equalToConstant: height)
        heightConstraint.priority = UILayoutPriority(rawValue: priority)
        heightConstraint.isActive = true
        let widthConstraint = widthAnchor.constraint(equalToConstant: width)
        widthConstraint.priority = UILayoutPriority(rawValue: priority)
        widthConstraint.isActive = true
    }
    
    func centerInSuperview() {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
    }
    
    func setConstraint(_ distance: CGFloat, of side: FourSides, to view: UIView, priority: Float = 800) {
        translatesAutoresizingMaskIntoConstraints = false
        let constraint: NSLayoutConstraint
        switch side {
        case .top:      constraint = topAnchor.constraint(equalTo: view.bottomAnchor, constant: -distance)
        case .bottom:   constraint = bottomAnchor.constraint(equalTo: view.topAnchor, constant: distance)
        case .leading:  constraint = leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: distance)
        case .trailing: constraint = trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -distance)
        }
        constraint.priority = UILayoutPriority(priority)
        constraint.isActive = true
    }
    
    func matchConstraints(of view: UIView) {
        if hasSameAncestor(with: view) {
            translatesAutoresizingMaskIntoConstraints = false
            topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        }
    }
    
    var compatibleSafeAreaLayoutGuide: LayoutGuideProvider {
        if #available(iOS 11, *) {
            return safeAreaLayoutGuide
        } else {
            return self
        }
    }
    
    func enable(animated: Bool = true, animationDuration: TimeInterval = 0.25) {
        guard !isUserInteractionEnabled else { return }
        isUserInteractionEnabled = true
        if animated {
            UIView.animate(withDuration: animationDuration) {
                self.alpha = 1
            }
        } else {
            alpha = 1
        }
        
    }
    func disable(animated: Bool = true, animationDuration: TimeInterval = 0.25) {
        guard isUserInteractionEnabled else { return }
        isUserInteractionEnabled = false
        if animated {
            UIView.animate(withDuration: animationDuration) {
                self.alpha = 0.4
            }
        } else {
            alpha = 0.4
        }
    }
}
