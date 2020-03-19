//
//  AlertUtils.swift
//  FullSmartLife
//
//  Created by Ziv on 2016/4/20.
//  Copyright © 2016年 Ziv. All rights reserved.
//

import UIKit

public class AlertUtils: NSObject {
    
    static var presentingVC: UIViewController?
    static var connectionTimeOutShowed = false
    
    class func showConnectionTimeOut(on vc: UIViewController, additionalInfo: String? = nil, completion: (()->())? = nil) {
        var text = "連線逾時".localized
        if additionalInfo != nil {
            text += ": \(additionalInfo!)"
        }
        if !connectionTimeOutShowed {
            connectionTimeOutShowed = true
            showSimpleAlert(title: text, message: nil, vc: vc) {
                connectionTimeOutShowed = false
                completion?()
            }
        }
    }
    
    /** show alert with 1 buttons, 1 callbacks */
    class func showSimpleAlert(
        title: String?,
        message: String?,
        actionTitle: String = "CONFIRM".localized,
        vc: UIViewController,
        completion: (()->())? = nil)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(
            title: actionTitle,
            style: .default,
            handler: { (action) in
                completion?()
        }))
        vc.present(alert, animated: true, completion: nil)
    }
    
    /** show alert with 2 buttons, 2 callbacks */
    class func showSimpleAlert(
        title: String,
        message: String?,
        vc: UIViewController,
        rightActionTitle: String = "CONFIRM".localized,
        leftActionTitle: String = "CANCEL".localized,
        doneCallback: @escaping ()->(),
        cancelCallback: (()->())? = nil)
    {    
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let doneAction: UIAlertAction = UIAlertAction(
            title: rightActionTitle,
            style: .default) { action -> Void in
                
                doneCallback()
        }
        
        let cancelAction: UIAlertAction = UIAlertAction(
            title: leftActionTitle,
            style: .cancel) { action -> Void in
                
                cancelCallback?()
        }
        
        alert.addAction(doneAction)
        alert.addAction(cancelAction)
        vc.present(alert, animated: true, completion: nil)
    }
    
    /** show alert with 1 textField, 2 action, 2 callbacks */
    class func showTextFieldAlert(
        title: String?,
        message: String?,
        textInTextField: String? = nil,
        placeholder: String?,
        keyboardType: UIKeyboardType = .default,
        mustContainsText: Bool = false,
        vc: UIViewController,
        rightActionTitle: String = "CONFIRM".localized,
        leftActionTitle: String = "CANCEL".localized,
        doneCallback: @escaping (_ textField: UITextField)->(),
        cancelCallback: (()->())? = nil)
    {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let doneAction: UIAlertAction = UIAlertAction(
            title: rightActionTitle,
            style: .default) { action -> Void in
                if let textField = alert.textFields?.last{
                    doneCallback(textField)
                    self.presentingVC = nil
                }
        }
        
        let cancelAction: UIAlertAction = UIAlertAction(
            title: leftActionTitle,
            style: .cancel) { action -> Void in
            
                cancelCallback?()
                self.presentingVC = nil
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = placeholder
            textField.text = textInTextField
            textField.keyboardType = keyboardType
            if mustContainsText {
                doneAction.isEnabled = textField.containsText
                textField.addTarget(self, action: #selector(textFieldValidator), for: .editingChanged)
            }
        }
        alert.addAction(cancelAction)
        alert.addAction(doneAction)
        presentingVC = vc
        vc.present(alert, animated: true, completion: nil)
    }
    
    @objc class func textFieldValidator(_ sender: UITextField) {
        guard
            let alert = presentingVC?.presentedViewController as? UIAlertController,
            let doneAction = alert.actions.last
        else {
            return
        }
        doneAction.isEnabled = sender.containsText
    }
    
    /** show alert with 1 destructive buttons, 1 normal button, 2 callbacks */
    class func showDestructiveConfirmation(
        title: String?,
        message: String?,
        vc: UIViewController,
        rightActionTitle: String = "CONFIRM".localized,
        leftActionTitle: String = "CANCEL".localized,
        destructiveCallback: @escaping ()->(),
        leftActionCallback: (()->())? = nil
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let rightAction: UIAlertAction = UIAlertAction(
            title: rightActionTitle,
            style: .destructive
        ) { action -> Void in
            destructiveCallback()
        }
        
        let leftAction: UIAlertAction = UIAlertAction(
            title: leftActionTitle,
            style: .cancel
        ) { action -> Void in
            leftActionCallback?()
        }
        
        alert.addAction(rightAction)
        alert.addAction(leftAction)
        vc.present(alert, animated: true, completion: nil)
    }

    class func confirmCancelAndPop(on vc: UIViewController) {
        showDestructiveConfirmation(
            title: "Discard Changes?".localized,
            message: "Any unsaved chages will be lost, please confirm.".localized,
            vc: vc,
            rightActionTitle: "CONFIRM".localized,
            destructiveCallback: {
                vc.navigationController?.popViewController(animated: true)
        })
    }
}



