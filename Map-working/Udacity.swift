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
    let sessionManager: SessionManager
    
    // MARK: Singleton
    private static var sharedManager = Udacity()
    
    class func sharedInstance() -> Udacity {
        
        return sharedManager
    }
    
    // Init Method
    init() {
        
        let apiUrlData = URLData(scheme: Contants.Udacity.APIComponents.scheme, host: Contants.Udacity.APIComponents.host, Path: Contants.Udacity.APIComponents.path)
        sessionManager = SessionManager(apiData: apiUrlData)
    }
}

// Mark: Helpers
extension Udacity {
    
    func request(url: URL, method: HTTPMethod, headers: [String : String]? = nil, body: [String : AnyObject]? = nil,
                 responseClosure : @escaping (_ jsonAsDictionary: [String:AnyObject]?, _ error: String?) -> Void) {
        
        // Required Header(s)
        var requiredHeaders = [Contants.Udacity.APIHeaderKeys.accept: Contants.Udacity.APIHeaderValues.application_json, Contants.Udacity.APIHeaderKeys.contentType: Contants.Udacity.APIHeaderValues.application_json]
        
        // Additional Header(s)
        if let headers = headers {
            for (key, value) in headers {
                requiredHeaders[key] = value
            }
        }
        
        // Session Manager - Request
        sessionManager.initiateRequest(Url: url, requestMethod: method, requestHeaders: requiredHeaders, requestBody: body) { (data, error) in
            
            // Data Exists?
            if let data = data {
                let jsonResponseDictionary = try! JSONSerialization.jsonObject(with: data.subdata(with: NSMakeRange(5, data.length - 5)), options: .allowFragments) as! [String : AnyObject]
                responseClosure(jsonResponseDictionary, nil)
            } else {
                responseClosure(nil, error)
            }
        }
        
    }
}







