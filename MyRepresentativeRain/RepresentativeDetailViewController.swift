//
//  RepresentativeDetailViewController.swift
//  MyRepresentativeRain
//
//  Created by Zach Steed on 3/17/16.
//  Copyright © 2016 Steedz. All rights reserved.
//

import UIKit
import SafariServices

class RepresentativeDetailViewController: UIViewController, SFSafariViewControllerDelegate {

    @IBOutlet weak var websiteButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var representative: Representative?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func websiteButtonTapped(sender: UIButton) {
        if let representative = representative {
            let svc = SFSafariViewController(URL: NSURL(string: representative.link)!)
            svc.delegate = self
            self.presentViewController(svc, animated: true, completion: nil)
        }
    }
    
    func safariViewControllerDidFinish(controller: SFSafariViewController) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }

    func updateWithRepresentative(representative:Representative) {
        self.representative = representative
        
        self.nameLabel.text = representative.name
        self.partyLabel.text = representative.party
        self.stateLabel.text = representative.state + " - " + representative.district
        self.phoneLabel.text = representative.phone
        self.addressLabel.text = representative.office
        self.websiteButton.setTitle("\(representative.link)", forState: .Normal)
    }
    
    

}
