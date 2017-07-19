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
        
        // Student Model
        let firstName = dictionary[Constants.Parse.JSONResponseKeys.firstName] as? String ?? ""
        let lastName = dictionary[Constants.Parse.JSONResponseKeys.lastName] as? String ?? ""
        let uniqueKey = dictionary[Constants.Parse.JSONResponseKeys.uniqueKey] as? String ?? ""
        let mediaUrl = dictionary[Constants.Parse.JSONResponseKeys.mediaURL] as? String ?? ""
        student = StudentModel(uniqueKey: uniqueKey, firstName: firstName, lastName: lastName, mediaUrl: mediaUrl)
        
        // Location Model
        let latitude = dictionary[Constants.Parse.JSONResponseKeys.latitude] as? Double ?? 0.0
        let longitude = dictionary[Constants.Parse.JSONResponseKeys.longitude] as? Double ?? 0.0
        let mapString = dictionary[Constants.Parse.JSONResponseKeys.location] as? String ?? ""
        location = LocationModel(latitude: latitude, longitude: longitude, location: mapString)
    }
    
    // Initializer(s)
    init(student: StudentModel, location: LocationModel) {
        objectID = ""
        self.student  = student
        self.location = location
    }
    
    init(objectID: String, student: StudentModel, location: LocationModel) {
        self.objectID = objectID
        self.student = student
        self.location = location
    }
}

// Helpers
extension StudentLocationModel {
    
    // Get Locations From Dictionaries
    static func getLocationsFromDictionaries(dictionaries: [[String:AnyObject]]) -> [StudentLocationModel] {
        var studentLocations = [StudentLocationModel]()
        for studentDictionary in dictionaries {
            studentLocations.append(StudentLocationModel(dictionary: studentDictionary))
        }
        return studentLocations
    }
}



