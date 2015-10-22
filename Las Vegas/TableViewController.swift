//
//  TableViewController.swift
//  Las Vegas
//
//  Created by Chris Archibald on 10/20/15.
//  Copyright © 2015 Chris Archibald. All rights reserved.
//

import UIKit

class TableViewController {
    
    var locations = [Location]()
    
    func locationFinder(locationFinder: ViewController, locations: [Location]) {
        self.locations = locations
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        var data = locations[indexPath.row]
        
        cell.textLabel?.text = data.name
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return locations.count
    }
    
}
