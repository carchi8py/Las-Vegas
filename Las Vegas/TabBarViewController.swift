//
//  TabBarViewController.swift
//  Las Vegas
//
//  Created by Chris Archibald on 10/20/15.
//  Copyright © 2015 Chris Archibald. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Added a search button
        let searchButton = UIBarButtonItem(title: "Search", style: UIBarButtonItemStyle.Plain, target: self, action: "searchTouched")
        self.navigationItem.setLeftBarButtonItem(searchButton, animated: true)
    }
    
    func searchTouched() {
        print("Search touched")
    }
}
