//
//  Errors.swift
//  Map-working
//
//  Created by Arshin Jain on 7/9/17.
//  Copyright © 2017 Arshin Jain. All rights reserved.
//

import Foundation
import UIKit

class Contants: NSObject {

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

    // MARK: Facebook Credentials
    class FacebookCredentials: NSObject {
        static let AppID = "365362206864879"
        static let URLSuffix = "onthemap"
        static let URLScheme = "fb\(AppID)\(URLSuffix)"
    }
    
    // MARK: Udacity
    class Udacity: NSObject {
        
        // API Components Constants
        struct APIComponents {
            static let scheme = "https"
            static let host = "www.udacity.com"
            static let path = "/api"
        }
        
        // API Methods
        struct APIMethods {
            static let session = "/session"
            static let users = "/users"
        }
        
        // API Header Keys
        struct APIHeaderKeys  {
            static let accept = "Accept"
            static let contentType = "Content-Type"
            static let XSRF_Token = "X-XSRF-TOKEN"
        }
        
        // API Header Values
        struct APIHeaderValues {
            static let application_json = "application/json"
        }
        
        // API Requeest Body Keys
        struct HTTPBodyKeys {
            static let udacity = "udacity"
            static let username = "username"
            static let password = "password"
        }
        
        // JSON Response Keys
        struct JSONResponseKeys {
            static let account = "account"
            static let key = "key"
            static let session = "session"
            static let user = "user"
            static let firstName = "first_name"
            static let lastName = "last_name"
            static let status = "status"
            static let error = "error"
        }
        
        // Cookies
        struct Cookies {
            static let XSRF_Token = "XSRF-TOKEN"
        }
        
        // Errors
        struct Errors {
            static let loginError = "User was Unable to Login. Please try again later."
            static let logoutError = "User was Unable to Logout. Please try again later."
            static let noUserData = "Not able to access user data."
            
        }

        // Signup URL
        static let signUpURL = "https://www.udacity.com/account/auth#!/signup"

    }
    
    // MARK: Parse
    class Parse {
        
        // API Components Constants
        struct APIComponents {
            static let scheme = "https"
            static let host = "parse.udacity.com"
            static let path = "/parse/classes"
        }
        
        // APIMethods
        struct APIMethod {
            static let studentLocation = "/StudentLocation"
        }
    }
}
