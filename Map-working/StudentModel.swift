//
//  StudentModel.swift
//  Map-working
//
//  Created by Arshin Jain on 7/18/17.
//  Copyright © 2017 Arshin Jain. All rights reserved.
//

import Foundation

struct StudentModel {
    
    // Name
    let uniqueKey: String
    let firstName: String
    let lastName:  String
    
    var fullName: String {
        return (firstName + " " + lastName)
    }
    
    var mediaUrl: String
    
    // Initializer
    init(uniqueKey: String, firstName: String, lastName: String, mediaUrl: String) {
        self.uniqueKey = uniqueKey
        self.firstName = firstName
        self.lastName  = lastName
        self.mediaUrl  = mediaUrl
    }
}
