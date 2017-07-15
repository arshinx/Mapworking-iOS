//
//  Errors.swift
//  Map-working
//
//  Created by Arshin Jain on 7/9/17.
//  Copyright © 2017 Arshin Jain. All rights reserved.
//

import Foundation
import UIKit

// Mark: Errors
class Errors: NSObject {
    
    static let usernameEmpty = "Please provide an Email Address."
    static let passwordEmpty = "Please provide the password."
    static let cannotOpenURL = "Cannot Open URL"
    static let unableToUpdateLocations = "Unable to update and pin down student locations."
    static let emptyurl = " You must enter a URL."
    static let emptyLocation = "Must enter a Location."
    static let couldNotGeocode = "Could not geocode the string."
    static let noLocationFound = "No location found."
    static let postingFailed = "Student location could not be posted."
    static let fetchingFailed = "Unable to fetch student locations. Please try again after some time or check your internet conectivity."
    
}

// Mark: Notifications
class Notifications: NSObject {
    static let studentLocationsPinnedDown = "Student Locations Pinned Down"
    static let studentLocationsPinnedDownError = "Student Locations Pinned Down Error"
    static let loading = "Loading"
}

// Mark: Alerts
class Alerts: NSObject {
    
    static let LoginAlertTitle = "Login Error"
    static let LogoutAlertTitle = "Logout Error"
    static let overWriteAlert = "Overwrite Location?"
    
}

// Mark: Identifiers
class Identifiers: NSObject {
    static let loginSegue = "Login"
    static let dropPinReuse = "DropPin"
    static let studentLocationCell = "StudentLocationCell"
    static let postingSegue = "presentPostingVC"
}

// MARK: FacebookCredentials
class FacebookCredentials: NSObject {
    
}
