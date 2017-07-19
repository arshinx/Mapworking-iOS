//
//  StudentLocationModel.swift
//  Map-working
//
//  Created by Arshin Jain on 7/18/17.
//  Copyright © 2017 Arshin Jain. All rights reserved.
//

import Foundation

struct StudentLocationModel {
    
    // MARK: Properties
    let student:  StudentModel
    let location: LocationModel
    let objectID: String
    
    // Initializer
    init(dictionary: [String : AnyObject]) {
        
        // Object ID
        objectID = dictionary[Constants.Parse.JSONResponseKeys.objectID] as? String ?? ""
    }
}
