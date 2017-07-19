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
    
    func createAlert(title: String, message: String) {
        
        // Create AlertController
        let alert: UIAlertController = UIAlertController(title: title,
                                                         message: message,
                                                         preferredStyle: .alert)
        
        // Create Action
        let action: UIAlertAction = UIAlertAction(title: "OK", style: .default)
        
        // Add Action
        alert.addAction(action)
        
        // Present Alert
        self.present(alert, animated: true)
    }
}
