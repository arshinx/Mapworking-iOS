//
//  SessionManager.swift
//  Map-working
//
//  Created by Arshin Jain on 7/15/17.
//  Copyright © 2017 Arshin Jain. All rights reserved.
//

import Foundation

// MARK: Struct
struct URLData {
    let scheme: String
    let host: String
    let Path: String
}

enum HTTPMethod: String {
    case GET, PUT, POST, DELETE
}

class SessionManager {
    
    // MARK: Variables
    private let session: URLSession!
    private let apiUrlData: URLData
    
    // Initializer
    init(apiData: URLData) {
        
        // Get your Configuration Object
        let sessionConfiguration = URLSessionConfiguration.default
        
        // Set the Configuration on your session object
        session = URLSession(configuration: sessionConfiguration)
        apiUrlData = apiData
    }

}

// MARK: Request Methods
extension SessionManager {
    
    //MARK: Data Task Request
    func initiateRequest(Url: URL, requestMethod: HTTPMethod, requestHeaders: [String:String]? = nil,
                         requestBody: [String:AnyObject]? = nil,
                         responseClosure: @escaping (NSData?, String?) -> Void){
        
        // Create request from passed URL
        var request = URLRequest(url: Url)
        request.httpMethod = requestMethod.rawValue
        
        // Add headers if present
        if let requestHeaders = requestHeaders {
            for (key, value) in requestHeaders {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        // Add body if present
        if let requestBody = requestBody {
            request.httpBody = try! JSONSerialization.data(withJSONObject: requestBody, options: JSONSerialization.WritingOptions())
        }
        
    }
    
}








