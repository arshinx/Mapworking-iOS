//
//  MapViewController.swift
//  Map-working
//
//  Created by Arshin Jain on 7/6/17.
//  Copyright © 2017 Arshin Jain. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(DataSource.sharedDataSource().studentLocations)
    }
    

}
