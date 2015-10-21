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
    
    func searchFourSquare(ll: String, completionHandler: (success: Bool, error: NSError?) -> Void) {
        
        let parameters : [String: AnyObject] = [
            VegasClient.JSONKeys.ll: ll,
            VegasClient.JSONKeys.clientID: VegasClient.Constants.fsClientID,
            VegasClient.JSONKeys.clientSecret: VegasClient.Constants.fsSecret,
            VegasClient.JSONKeys.fsVersion: VegasClient.Constants.fsVersion
        ]
        
        let task = taskForFourSquareGetMethod(VegasClient.Methods.search, paramters: parameters) {
            JSONResults, error in
            if let error = error {
                print("Something bad happend")
                completionHandler(success: false, error: error)
            } else {
                do {
                    let jsonData = try NSJSONSerialization.JSONObjectWithData(JSONResults! as! NSData, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    print("\(jsonData)")
                } catch {
                    print("Something bad happened")
                }
                print("W00t")
                completionHandler(success: true, error: nil)
            }
        }
        

    }
    
    func taskForFourSquareGetMethod(method: String, paramters: [String : AnyObject], completionHandler: (result: AnyObject!, error: NSError?) -> Void) -> NSURLSessionDataTask {
        let mutableParameters = paramters
        
        let urlString = VegasClient.Constants.fsBaseURL + method + VegasClient.escapedParameters(mutableParameters)
        print(urlString)
        let url = NSURL(string: urlString)!
        let request = NSMutableURLRequest(URL: url)
        
        let task = session.dataTaskWithRequest(request) { data, response, downloadError in
            if let error = downloadError {
                completionHandler(result: nil, error: error)
            } else {
                completionHandler(result: data, error: nil)
            }
        }
        task.resume()
        return task
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
