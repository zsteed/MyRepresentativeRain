//
//  RepresentativeDetailViewController.swift
//  MyRepresentativeRain
//
//  Created by Zach Steed on 3/17/16.
//  Copyright © 2016 Steedz. All rights reserved.
//

import UIKit

class RepresentativeDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    
    var representative: Representative?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func updateWithRepresentative(representative:Representative) {
        self.representative = representative
        
        self.nameLabel.text = representative.name
    }
    
    

}
