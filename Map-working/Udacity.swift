//
//  Udacity.swift
//  Map-working
//
//  Created by Arshin Jain on 7/8/17.
//  Copyright © 2017 Arshin Jain. All rights reserved.
//

import UIKit

class Udacity: NSObject {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    // Login
    func login(username: String, password: String, completion: @escaping (_ success: Bool,_ errorMessage: String?, _ error: NSError?) -> Void) {
        
        // Request
        let request = NSMutableURLRequest(url: NSURL(string: "https://www.udacity.com/api/session") as! URL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = "{\"udacity\": {\"username\": \"\(username)\", \"password\": \"\(password)\"}}".data(using: String.Encoding.utf8)
        
        // Session
        let session = URLSession.shared
        
        // Errors
        // let errors = Errors()
        
        // Task
        let task = session.dataTask(with: request as URLRequest) { (data, res, error) in
            
            // Handle
            func handleError(error: String, errorMessage: String) {
                let userInfo = [NSLocalizedDescriptionKey: error]
                completion(false, errorMessage, NSError(domain: "login", code: 1, userInfo: userInfo))
            }
            
            //Errror status outside rangge of 201 and 299
            guard let statusCode = (res as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
                handleError(error: "Your request returned a status code other than 2xx!", errorMessage: Errors.InvalidError)
                return
            }
            
            guard let data = data else {
                handleError(error: "No Data Was Returned By The Request!", errorMessage: Errors.CantLogin)
                return
            }
            
            // MARK: Data Processing
            
            let stringData = String(data: data, encoding: String.Encoding.utf8)
            print(stringData ?? "Done!")
            
            let newData = data.subdata(in: Range(uncheckedBounds: (5, data.count)))

        }
        
    }
    
    
}
