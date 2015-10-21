//
//  Location.swift
//  Las Vegas
//
//  Created by Chris Archibald on 10/20/15.
//  Copyright © 2015 Chris Archibald. All rights reserved.
//

import UIKit
import CoreData

@objc(Location)

class Location: NSManagedObject {
    
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
    
    @NSManaged var name: String
    @NSManaged var lat: Double
    @NSManaged var lng: Double
    @NSManaged var url: String
    @NSManaged var hereNow: Int
    @NSManaged var totalCheckins: Int
    @NSManaged var fsID: Int
    
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    init(dictionary: [String: AnyObject], context: NSManagedObjectContext) {
        
        //Code Data
        let entity = NSEntityDescription.entityForName("Location", inManagedObjectContext: context)!
        super.init(entity: entity, insertIntoManagedObjectContext: context)
        
        //dictionary
        name = dictionary[Keys.Name] as! String
        lat = dictionary[Keys.Lat] as! Double
        lng = dictionary[Keys.Lng] as! Double
        url = dictionary[Keys.Url] as! String
        hereNow = dictionary[Keys.HereNow] as! Int
        totalCheckins = dictionary[Keys.CheckinsCount] as! Int
        fsID = dictionary[Keys.FSID] as! Int
    }
}