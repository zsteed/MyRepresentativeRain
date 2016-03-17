//
//  RepresentativeController.swift
//  MyRepresentativeRain
//
//  Created by Zach Steed on 3/17/16.
//  Copyright © 2016 Steedz. All rights reserved.
//

import UIKit

class RepresentativeController {

    static let sharedInstance = RepresentativeController()
    
    var myRepresentatives: [Representative] = []
    
    static func searchForRepresentativeByState(state:String, completion:(representatives:[Representative]?)->Void) {
        
        let url = NetworkController.searchByState(state)
        
        NetworkController.dataAtURL(url) { (json) -> Void in
            if let jsonData = json {
                var representatives = [Representative]()
                if let results = jsonData["results"] as? [[String:AnyObject]] {
                    for result in results {
                        if let representative = Representative(jsonDictionary: result) {
                            representatives.append(representative)
                            completion(representatives: representatives)
                        }
                    }
                } else {
                    completion(representatives: [])
                }
            }
        }
    }
}
