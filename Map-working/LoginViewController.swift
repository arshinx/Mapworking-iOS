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
        
    }
    
    @IBAction func Signup(_ sender: Any) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // TextField Delegate - enables touch to dismiss for Keyboard
        self.emailField.delegate    = self
        self.passwordField.delegate = self
    }

}
