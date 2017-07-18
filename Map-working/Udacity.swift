//
//  Udacity.swift
//  Map-working
//
//  Created by Arshin Jain on 7/8/17.
//  Copyright © 2017 Arshin Jain. All rights reserved.
//

import UIKit

class Udacity {
    
    // Variables
    let sessionObject: SessionManager
    
    // MARK: Singleton
    private static var sharedManager = Udacity()
    
    class func sharedInstance() -> Udacity {
        
        return sharedManager
    }
    
    // Init Method
    init() {
        
        let apiUrlData = URLData(scheme: Contants.Udacity.APIComponents.scheme, host: Contants.Udacity.APIComponents.host, Path: Contants.Udacity.APIComponents.path)
        sessionObject = SessionManager(apiData: apiUrlData)
    }
}

// Mark: Helpers
extension Udacity {
    
    func request(url: URL, method: HTTPMethod, headers: [String : String]? = nil, body: [String : AnyObject]? = nil,
                 responseClosure : @escaping (_ jsonAsDictionary: [String:AnyObject]?, _ error: String?) -> Void) {
        
        // Required Header(s)
        var requiredHeaders = [Contants.Udacity.APIHeaderKeys.accept: Contants.Udacity.APIHeaderValues.application_json, Contants.Udacity.APIHeaderKeys.contentType: Contants.Udacity.APIHeaderValues.application_json]
        
    }
}







