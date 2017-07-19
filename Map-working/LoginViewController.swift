//
//  LoginViewController.swift
//  Map-working
//
//  Created by Arshin Jain on 7/6/17.
//  Copyright © 2017 Arshin Jain. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: Properties
    let udacity     = Udacity.sharedInstance()
    let dataSource  = DataSource.sharedDataSource()
    
    // Outlets
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    // Actions
    @IBAction func Login(_ sender: Any) {
        
        if emailField.text!.isEmpty {
            
            self.createAlert(alertTitle: "Empty Field", message: Constants.Errors.usernameEmpty, actionStyle: .default, actionTitle: "Okay")
        } else if passwordField.text!.isEmpty {
            
            self.createAlert(alertTitle: "Empty Field", message: Constants.Errors.passwordEmpty, actionStyle: .default, actionTitle: "Okay")
        } else {
            
            // Login to Udacity
            udacity.login(username: emailField.text!, password: passwordField.text!, responseClosure: { (key, error) in
                
                // Get Data Asynchronously
                DispatchQueue.main.async {
                    
                }
            })
        }
    }
    
    @IBAction func Signup(_ sender: Any) {
        
        // Open Udacity signup link
        if let signupURL = URL(string: Constants.Udacity.signupURL), UIApplication.shared.canOpenURL(signupURL) {
            UIApplication.shared.open(signupURL)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // TextField Delegate - enables touch to dismiss for Keyboard
        self.emailField.delegate    = self
        self.passwordField.delegate = self
    }

}

// Keyboard Dismiss - LoginViewController TextField Delegate
extension LoginViewController: UITextFieldDelegate {
    
    // Dismiss Keyboard with return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
