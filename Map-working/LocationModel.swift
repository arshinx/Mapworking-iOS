//
//  LocationModel.swift
//  Map-working
//
//  Created by Arshin Jain on 7/18/17.
//  Copyright © 2017 Arshin Jain. All rights reserved.
//

import Foundation
import MapKit

struct LocationModel {
    
    // Coordinates
    let latitude:  Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(latitude, longitude)
    }
}
