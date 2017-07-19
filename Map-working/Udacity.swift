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
        
        let apiUrlData = URLData(scheme: Constants.Udacity.APIComponents.scheme, host: Constants.Udacity.APIComponents.host, Path: Constants.Udacity.APIComponents.path)
        sessionManager = SessionManager(apiData: apiUrlData)
    }
}

// Mark: Core Methods
extension Udacity {
    
    // -----
    // Login
    func login(username: String, password: String, facebookToken: String? = nil,
               responseClosure: @escaping (_ userKey: String?, _ error: String?) -> Void) {
        
        // Setup
        let loginURL = sessionManager.urlForRequest(apiMethod: Constants.Udacity.APIMethods.session)
        var loginBody = [String : Any]()
        loginBody[Constants.Udacity.HTTPBodyKeys.udacity] = [Constants.Udacity.HTTPBodyKeys.username: username, Constants.Udacity.HTTPBodyKeys.password: password]
        
        // Request
        request(url: loginURL, method: .POST, body: loginBody as [String : AnyObject]?) {(jsonResponseDictionary, error) in
            
            // Errors?
            guard error == nil else {
                responseClosure(nil, error)
                return
            }
            
            // Recognized Error?
            if let jsonResponseDictionary = jsonResponseDictionary,
                let _ = jsonResponseDictionary[Constants.Udacity.JSONResponseKeys.status] as? Int,
                let error = jsonResponseDictionary[Constants.Udacity.JSONResponseKeys.error] as? String {
                
                responseClosure(nil, error)
                return
            }
            
            // JSON Dictionary Contents
            if let jsonResponseDictionary = jsonResponseDictionary,
                let account = jsonResponseDictionary[Constants.Udacity.JSONResponseKeys.account] as? [String : AnyObject],
                let key = account[Constants.Udacity.JSONResponseKeys.key] as? String {
                
                responseClosure(key, nil)
                return
            }
            
            responseClosure(nil, Constants.Udacity.Errors.loginError)
        }
    }
    
    // -----
    // Get Student Data
    
    func getStudentData(key: String, responseClosure: @escaping (_ student: StudentModel?, _ error: String?) -> Void) {
        
        // Student URL
        let studentURL = sessionManager.urlForRequest(apiMethod: Constants.Udacity.APIMethods.users, pathExtension: "/\(key)")
        
        // Request
        request(url: studentURL, method: .GET) { (jsonResDict, error) in
            
            // Errors?
            guard error == nil else {
                responseClosure(nil, error)
                return
            }
            
            if let jsonResDict = jsonResDict,
                let userInformation = jsonResDict[Constants.Udacity.JSONResponseKeys.user] as? [String : AnyObject],
                let firstName = userInformation[Constants.Udacity.JSONResponseKeys.firstName] as? String,
                let lastName = userInformation[Constants.Udacity.JSONResponseKeys.lastName] as? String {
                
                responseClosure(StudentModel(uniqueKey: key, firstName: firstName, lastName: lastName, mediaUrl: ""), nil)
                return
            }
            
            responseClosure(nil, Constants.Udacity.Errors.noUserData)
            
        }
    }
    
    // ----
    // Logout
    func logout(responseClosure: @escaping (_ success: Bool, _ error: String?) -> Void) {
        
        // Setup
        let logoutURL = sessionManager.urlForRequest(apiMethod: Constants.Udacity.APIMethods.session)
        
        // Check Cookies & Set Required Headers
        var xsrfCookie: HTTPCookie? = nil
        var logoutHeaders = [String : AnyObject]()
        
        // Cookie and Shared Storage
        let sharedCookieStorage = HTTPCookieStorage.shared
        for cookie in sharedCookieStorage.cookies! {
            if cookie.name == Constants.Udacity.Cookies.XSRF_Token{
                xsrfCookie = cookie
            }
        }
        
        // Headers
        if let xsrfCookie = xsrfCookie {
            logoutHeaders[Constants.Udacity.APIHeaderKeys.XSRF_Token] = xsrfCookie.value as AnyObject?
        }
        
        request(url: logoutURL, method: .DELETE) { (jsonResponseDic, error) in
            
            // Errors?
            guard error == nil else {
                responseClosure(false, error)
                return
            }

            // Parse JSON
            if let jsonResDict = jsonResponseDic, let _ = jsonResponseDic?[Constants.Udacity.JSONResponseKeys.session]
                as? [String : AnyObject] {
                
                responseClosure(true, nil)
                return
            }

            responseClosure(false, Constants.Udacity.Errors.logoutError)
        }

    }
}

// Mark: Helpers
extension Udacity {
    
    func request(url: URL, method: HTTPMethod, headers: [String : String]? = nil, body: [String : AnyObject]? = nil,
                 responseClosure : @escaping (_ jsonAsDictionary: [String:AnyObject]?, _ error: String?) -> Void) {
        
        // Required Header(s)
        var requiredHeaders = [Constants.Udacity.APIHeaderKeys.accept: Constants.Udacity.APIHeaderValues.application_json, Constants.Udacity.APIHeaderKeys.contentType: Constants.Udacity.APIHeaderValues.application_json]
        
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







