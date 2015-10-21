//
//  Location.swift
//  Las Vegas
//
//  Created by Chris Archibald on 10/20/15.
//  Copyright © 2015 Chris Archibald. All rights reserved.
//

import UIKit


class Location {
    struct Keys {
        // The name of the place
        static let Name = "name"
        // The location
        static let Lat = "lat"
        static let Lng = "lng"
        // The url
        static let Url = "url"
        // The number of people here
        static let HereNow = "hereNow"
        // The number of people who have ever been here
        static let CheckinsCount = "checkinsCount"
        // The Foursquare ID -- will let us get picture later
        static let FSID = "id"
    }
    
    var name: String
    var lat: Double
    var lng: Double
    var url: String
    var hereNow: Int
    var totalCheckins: Int
    var fsID: Int
    
    init(dictionary: [String: AnyObject]) {
        name = dictionary[Keys.Name] as! String
        lat = dictionary[Keys.Lat] as! Double
        lng = dictionary[Keys.Lng] as! Double
        url = dictionary[Keys.Url] as! String
        hereNow = dictionary[Keys.HereNow] as! Int
        totalCheckins = dictionary[Keys.CheckinsCount] as! Int
        fsID = dictionary[Keys.FSID] as! Int
    }
}