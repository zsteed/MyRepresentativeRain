//
//  RepresentativeSearchViewController.swift
//  MyRepresentativeRain
//
//  Created by Zach Steed on 3/17/16.
//  Copyright © 2016 Steedz. All rights reserved.
//

import UIKit

class RepresentativeSearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        RepresentativeController.searchForRepresentativeByState("UT") { (representatives) -> Void in
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
