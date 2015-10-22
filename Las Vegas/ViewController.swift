//
//  ViewController.swift
//  Las Vegas
//
//  Created by Chris Archibald on 10/16/15.
//  Copyright © 2015 Chris Archibald. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    var locations = [Location]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pushMePressed(sender: AnyObject) {
        
        //TODO: Add UIActivityIndicator
        
        search()
    }
    
    func search () {
        
        let location = "36.1246126,-115.1720222"
        
        VegasClient.sharedInstance().searchFourSquare(location, completionHandler: {
            success, results, error in
            if success {
                var results = results as! NSArray
                var test = results[0]
                for each in results {
                    let name = each["name"] as! String
                    let location = each["location"] as! NSDictionary
                    let lat = location["lat"] as! Double
                    let lng = location["lng"] as! Double
                    let url = each["url"] as! String
                    let hereNow = each["hereNow"] as! NSDictionary
                    let count = hereNow["count"] as! Int
                    let stats = each["stats"] as! NSDictionary
                    let checkins = stats["checkinsCount"] as! Int
                    let id = each["id"] as! String
                    self.addLocation(name, lat: lat, lng: lng, url: url, count: count, checkins: checkins, id: id)
                }
            }  else {
                print("It failed")
            }
        })
    }
    
    func addLocation(name: String, lat: Double, lng: Double, url: String, count: Int, checkins: Int, id: String) {
        var newObject : [String: AnyObject] = [
            "name": name,
            "lat": lat,
            "lng": lng,
            "url": url,
            "hereNow": count,
            "checkinsCount": checkins,
            "id": id]
        print(locations)
        print("hi")
    }
    
}

