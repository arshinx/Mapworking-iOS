//
//  AppDelegate.swift
//  Map-working
//
//  Created by Arshin Jain on 7/4/17.
//  Copyright © 2017 Arshin Jain. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // MARK: Data Model
    var userID:     String = ""
    var firstName:  String = ""
    var lastname:   String = ""
    var objectID:   String = ""
    var uniqueKey:  String = ""
    var update:     Bool   = false

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

}

