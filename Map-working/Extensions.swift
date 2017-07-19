//
//  Extensions.swift
//  Map-working
//
//  Created by Arshin Jain on 7/18/17.
//  Copyright © 2017 Arshin Jain. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func createAlert(alertTitle: String, message: String, actionStyle: UIAlertActionStyle, actionTitle: String) {
        
        // Create AlertController
        let alert: UIAlertController = UIAlertController(title: alertTitle,
                                                         message: message,
                                                         preferredStyle: .alert)
        
        // Create Action
        let action: UIAlertAction = UIAlertAction(title: actionTitle, style: actionStyle)
        
        // Add Action
        alert.addAction(action)
        
        // Present Alert
        self.present(alert, animated: true)
    }
}
