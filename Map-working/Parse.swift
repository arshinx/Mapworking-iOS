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
        
        // Request
        request(url: url, method: .GET) { (jsonResDict, error) in
            
            // Errors?
            guard error == nil else {
                
                responseClosure(nil, error)
                return
            }
            
            // Parse JSON
            if let jsonResDict = jsonResDict,
                let studentLocationDics = jsonResDict[Constants.Parse.JSONResponseKeys.results] as? [[String : AnyObject]] {
                
                responseClosure(StudentLocationModel.getLocationsFromDictionaries(dictionaries: studentLocationDics), nil)
                
                return
            }

            responseClosure(nil, error)
        }
    }
    
    // Get Student Location
    func getStudentLocation(uniqueKey: String, responseClosure:
        @escaping (_ studentModel: StudentLocationModel?, _ error: String?) -> Void) {
        
        // Create URL
        let locationURL = sessionManager.urlForRequest(apiMethod: Constants.Parse.APIMethod.studentLocation, parameters: [Constants.Parse.ParameterKeys.Where: "{\"\(Constants.Parse.ParameterKeys.uniqueKey)\":\"" + "\(uniqueKey)" + "\"}" as AnyObject])
        
        // Request
        request(url: locationURL, method: .GET) { (jsonResDict, error) in
            
            // Error?
            guard error == nil else {
                responseClosure(nil, error)
                return
            }
            
            // Parse Json
            if let jsonResDict = jsonResDict, let studentLocationDict = jsonResDict[Constants.Parse.JSONResponseKeys.results] as? [[String : AnyObject]] {
                
                // Return a student
                if studentLocationDict.count == 1 {
                    responseClosure(StudentLocationModel(dictionary: studentLocationDict[0]), nil)
                    return
                }
                
            }
            
            // Closure
            responseClosure(nil, error)
        }
    }
    
    // --- ------------- ---
    // Post Student Location
    func postStudentLocation(studentData: StudentLocationModel, mediaUrl: String, responseClosure: @escaping (_ success: Bool, _ error: String?) -> Void) {
        
        // Create URL
        let url = sessionManager.urlForRequest(apiMethod: Constants.Parse.APIMethod.studentLocation)
        
        // Json Body
        let requestBody: [String : AnyObject] =
            [Constants.Parse.StudentLocationKeys.uniqueKey: studentData.student.uniqueKey as AnyObject,
             Constants.Parse.StudentLocationKeys.firstName: studentData.student.firstName as AnyObject,
             Constants.Parse.StudentLocationKeys.lastName:  studentData.student.lastName as AnyObject,
             Constants.Parse.StudentLocationKeys.mapString: studentData.location.location as AnyObject,
             Constants.Parse.StudentLocationKeys.mediaURL:  mediaUrl as AnyObject,
             Constants.Parse.StudentLocationKeys.latitude:  studentData.location.latitude as AnyObject,
             Constants.Parse.StudentLocationKeys.longitude: studentData.location.longitude as AnyObject
        ]
        
        // Request
        request(url: url, method: .POST, body: requestBody){ (jsonAsDictionary, error) in
            
            
        }
        
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










