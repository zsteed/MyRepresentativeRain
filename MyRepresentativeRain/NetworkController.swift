//
//  NetworkController.swift
//  MyRepresentativeRain
//
//  Created by Zach Steed on 3/17/16.
//  Copyright © 2016 Steedz. All rights reserved.
//

import UIKit

class NetworkController {

    static let baseURL = "http://whoismyrepresentative.com"
    
    static func searchByState(stateName:String) ->NSURL {
        return NSURL(string: baseURL + "/getall_reps_bystate.php?state=\(stateName)&output=json")!
    }
    
    static func dataAtURL(url:NSURL, completion:(json:[String:AnyObject]?)->Void) {
        
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithURL(url) { (data, response, error) -> Void in
            if let data = data {
                let jsonData = try? NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String:AnyObject]
                completion(json: jsonData!)
            } else {
                print("Error serializing data")
            }
        }
        dataTask.resume()
    }
}
