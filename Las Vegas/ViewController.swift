//
//  ViewController.swift
//  Las Vegas
//
//  Created by Chris Archibald on 10/16/15.
//  Copyright © 2015 Chris Archibald. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
                    print(each["name"])
                    var location = each["location"] as! NSDictionary
                    print(location["lat"])
                    print(location["lng"])
                    print(each["url"])
                    var hereNow = each["hereNow"] as! NSDictionary
                    print(hereNow["count"])
                    var stats = each["stats"] as! NSDictionary
                    print(stats["checkinsCount"])
                    print(each["id"])
                    print("---------")
                }
            }  else {
                print("It failed")
            }
        })
    }
}

