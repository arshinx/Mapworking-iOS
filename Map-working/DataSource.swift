//
//  DataSource.swift
//  Map-working
//
//  Created by Arshin Jain on 7/18/17.
//  Copyright © 2017 Arshin Jain. All rights reserved.
//

import UIKit

class DataSource: NSObject {
    
    // MARK: Properties
    
    // Variables
    private let parse = Parse()
    var studentLocations = [StudentLocationModel]()
    var studentUser: StudentModel? = nil
    private static let sharedInstance = DataSource()

    // Singleton
    class func sharedDataSource() -> DataSource  {
        return sharedInstance
    }
    
    // Pin Down Student Locations - Notifications / Broadcast
    func pinDownStudentLocations() {
        
        // Get last 100 locations
        parse.recentHundredLocations() { (studentLocationDict, error) in
            
            // Error?
            if let _ = error {
                
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.Notifications.studentLocationsPinnedDownError), object: nil)
                
            } else {
                
                guard let studentLocationDict = studentLocationDict else {
                    
                    return
                }
                
                self.studentLocations = studentLocationDict
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.Notifications.studentLocationsPinnedDown), object: nil);

            }
        }
    }

}
