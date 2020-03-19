//
//  UIViewController_Extension.swift
//  FullSmartLife
//
//  Created by Luke on 2018/10/24.
//  Copyright © 2018 FULL CORP. All rights reserved.
//

import UIKit
import Themes

extension UIViewController {
    
    
    
    /** view.frame.height - statusbar height - navigationBar height */
    var pureViewHeight: CGFloat {
        let statusBarHeight = UIApplication.shared.statusBarView?.frame.height ?? 0
        let navBarHeight = navigationController?.navigationBar.frame.height ?? 0
        return view.frame.height - statusBarHeight - navBarHeight
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func setNavBarColor(alpha: CGFloat = 1) {
        use(MyTheme.self) {
            let navBarColor = $1.navHeaderBackColor.withAlphaComponent(alpha)
            self.navigationController?.navigationBar.backgroundColor = navBarColor
            
            UIApplication.shared.statusBarView?.backgroundColor = navBarColor
            
            self.navigationController?.navigationBar.barStyle = .black
            self.navigationController?.navigationBar.titleTextAttributes = [
                .foregroundColor : $1.navHeaderWordsColor.withAlphaComponent(alpha)
            ]
        }
        
      
    }
    
    
    func updateHeaderWithAnimation(title: String, alpha: CGFloat, duration: TimeInterval = 0.15) {
        UIView.animate(withDuration: duration, animations: {
            self.title = ""
            self.setNavBarColor(alpha: alpha)
        
        }) { (success) in
            self.title = title
            self.setNavBarColor(alpha: alpha)
            
        }
    }
    
    func setupBackgroundImage(with image: UIImage?) {
        guard let image = image else { return }
        let iv = UIImageView()
        iv.image = image
        iv.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(iv)
        view.sendSubviewToBack(iv)
        iv.fillSuperview()
    }
    
    
    
    func setupPopupViewFrame(maxHeight: CGFloat) {
        guard let currentWindow = UIApplication.shared.keyWindow else { return }
        let height: CGFloat = min(currentWindow.frame.height * 0.5, maxHeight)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func setupRootViewConstraint(width: CGFloat?, height: CGFloat?) {
        guard width != nil || height != nil else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        if let width = width {
            view.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            view.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    var topbarHeight: CGFloat {
        return   self.navigationController?.navigationBar.frame.size.height ?? 0.0
     }
    
    
    var stateHeight:CGFloat{
        return  UIApplication.shared.statusBarView?.frame.height ?? 0
    }
    
    var navigationBarHeight:CGFloat{
        return  stateHeight + topbarHeight
    }
    
    
}


