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
            success, error in
            if success {
                print("It worked")
            }  else {
                print("It failed")
            }
        })
    }

}

