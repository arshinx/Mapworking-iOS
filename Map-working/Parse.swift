//
//  Parse.swift
//  Map-working
//
//  Created by Arshin Jain on 7/16/17.
//  Copyright © 2017 Arshin Jain. All rights reserved.
//

import Foundation

class Parse {
    
    // Properties
    let sessionManager: SessionManager
    
    private static var sharedManager = Parse()
    class func sharedInstance() -> Parse {
        return sharedManager
    }
    
    // Initializer
    
    init() {
        let apiUrlData = URLData(scheme: Constants.Parse.APIComponents.scheme, host: Constants.Parse.APIComponents.host, Path: Constants.Parse.APIComponents.path)
        sessionManager = SessionManager(apiData: apiUrlData)
    }
    
}

// Helper
extension Parse {
    
}
