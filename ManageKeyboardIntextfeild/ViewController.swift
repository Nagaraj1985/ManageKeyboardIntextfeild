//
//  ViewController.swift
//  ManageKeyboardIntextfeild
//
//  Created by rahulsagar on 25/07/20.
//  Copyright © 2020 Nagaraj Panni. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var textConstraint: NSLayoutConstraint!
    @IBOutlet weak var nameTextFeild: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(KeyBoardVisible(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        // Do any additional setup after loading the view.
    }
    
    @objc func KeyBoardVisible(notification: Notification) {
        if let userInfo = notification.userInfo as? Dictionary<String,AnyObject> {
            let keyBoardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey]
            let keyBoarsRect = keyBoardFrame?.cgRectValue
            if let keyBoardHieght = keyBoarsRect?.height{
                self.textConstraint.constant = keyBoardHieght
            }
        }
    }
    
    @objc func keyBoardHide(notification: NSNotification) {
        self.textConstraint.constant = 50.0
    }
  
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

