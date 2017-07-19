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

// Core Methods
extension Parse {
    
    // Get last 100 student locations
    func recentHundredLocations(responseClosure: @escaping (_ studentLocations: [StudentLocationModel]?, _ error: String?) -> Void) {
        
        // Create URL
        let url = sessionManager.urlForRequest(apiMethod: Constants.Parse.APIMethod.studentLocation, parameters: [
            Constants.Parse.ParameterKeys.limit: Constants.Parse.ParameterValues.hundred as AnyObject,
            Constants.Parse.ParameterKeys.order: Constants.Parse.ParameterValues.recentlyUpdated as AnyObject
            ])
    }
    
}

// Helper
extension Parse {
    
    // ----
    // Request to Parse
    func request(url: URL, method: HTTPMethod, body: [String : AnyObject]? = nil,
                 responseClosure : @escaping (_ jsonAsDictionary: [String:AnyObject]?, _ error: String?) -> Void) {
        
        // Headers
        let requestHeaders = [
            Constants.Parse.RequestHeaderKeys.appId:        Constants.Parse.RequestHeaderValues.appId,
            Constants.Parse.RequestHeaderKeys.APIKey:       Constants.Parse.RequestHeaderValues.APIKey,
            Constants.Parse.RequestHeaderKeys.accept:       Constants.Parse.RequestHeaderValues.application_json,
            Constants.Parse.RequestHeaderKeys.content_type: Constants.Parse.RequestHeaderValues.application_json
        ]
        
        // Request
        sessionManager.initiateRequest(Url: url, requestMethod: method, requestHeaders: requestHeaders, requestBody: body) { (data, error) in
            
            // Data?
            if let data = data {
                
                let jsonResDict = try! JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as! [String : AnyObject]
                responseClosure(jsonResDict, nil)
            } else {
                
                 responseClosure(nil, error)
            }
            
        }
        
    }
    
}










