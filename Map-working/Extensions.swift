//
//  Extensions.swift
//  Map-working
//
//  Created by Arshin Jain on 7/18/17.
//  Copyright © 2017 Arshin Jain. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
    
    func createAlert(alertTitle: String, message: String, style: UIAlertControllerStyle, actionTitle: String) {
        
        // Create AlertController
        let alert: UIAlertController = UIAlertController(title: alertTitle,
                                                         message: message,
                                                         preferredStyle: style)
        
        // Create Action
        let action: UIAlertAction = UIAlertAction(title: actionTitle, style: .default)
        
        // Add Action
        alert.addAction(action)
        
        // Present Alert
        self.present(alert, animated: true)
    }
}
