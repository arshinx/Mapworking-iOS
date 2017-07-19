//
//  DataSource.swift
//  Map-working
//
//  Created by Arshin Jain on 7/18/17.
//  Copyright © 2017 Arshin Jain. All rights reserved.
//

import UIKit

class DataSource: NSObject {
    
    // MARK: Properties
    private let parse = Parse
    var studentLocations = [StudentLocationModel]()
    var studentUser: StudentModel? = nil
    private static let sharedInstance = DataSource()


}
