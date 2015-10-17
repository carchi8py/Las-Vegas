//
//  VegasClient.swift
//  Las Vegas
//
//  Created by Chris Archibald on 10/16/15.
//  Copyright © 2015 Chris Archibald. All rights reserved.
//

import UIKit

class VegasClient: NSObject {
    
    var session: NSURLSession
    var sessionID: String? = nil
    
    override init() {
        session = NSURLSession.sharedSession()
    }
    
    
    /*****  HELPER FUNCTIONS  *****/
    
    //Return a shared instance of the Vegas Class
    class func sharedInstance() -> VegasClient {
        struct Singleton {
            static var sharedInstance = VegasClient()
        }
        return Singleton.sharedInstance
    }
    
    //This function escaped Special charater in the paremeters we pass to a 
    //web server
    class func escapedParameters(parameters: [String : AnyObject]) -> String {
        var urlVars = [String]()
        
        for (key, value) in parameters {
            
            /* Make sure that it is a string value */
            let stringValue = "\(value)"
            
            /* Escape it */
            let escapedValue = stringValue.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
            
            /* Append it */
            urlVars += [key + "=" + "\(escapedValue!)"]
        }
        let separator = "&"
        return (!urlVars.isEmpty ? "?" : "") + urlVars.joinWithSeparator(separator)
    }

}
