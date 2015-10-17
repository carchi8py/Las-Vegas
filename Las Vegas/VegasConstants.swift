//
//  VegasConstants.swift
//  Las Vegas
//
//  Created by Chris Archibald on 10/16/15.
//  Copyright © 2015 Chris Archibald. All rights reserved.
//

import Foundation

extension VegasClient {
    
    //These are constants that should change
    struct Constants {
        static let fsBaseURL = "https://api.foursquare.com/v2/venues/"
        static let fsClientID = "QLHZUN0VNMCUV0OMSJPTE0EBH3BQVMYLR41OUGQONTMWRLSJ"
        static let fsSecret = "TXY4D3TTKCUOXVGZEXLRCRHOPBEMLS0FBGSP2SVN14O52ZB2"
        static let fsVersion = "20150906"
    }
    
    //These are API methods
    struct Methods  {
        static let search = "search"
    }
    
    struct JSONKeys {
        static let ll = "ll"
        static let clientID = "client_id"
        static let clientSecret = "client_secret"
        static let fsVersion = "v"
    }
    
    
}
