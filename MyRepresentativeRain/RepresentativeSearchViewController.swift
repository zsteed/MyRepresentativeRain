//
//  RepresentativeSearchViewController.swift
//  MyRepresentativeRain
//
//  Created by Zach Steed on 3/17/16.
//  Copyright © 2016 Steedz. All rights reserved.
//

import UIKit

class RepresentativeSearchViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var states = ["AK", "AL", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator.hidden = true
    }
    
    @IBAction func searchButtonTapped(sender: UIButton) {
        self.activityIndicator.hidden = false
        self.activityIndicator.startAnimating()
        
        let rowIndex = self.pickerView.selectedRowInComponent(0)
        let selectedState = self.states[rowIndex]
        
        RepresentativeController.searchForRepresentativeByState(selectedState) { (representatives, error) -> Void in
            if let error = error {
                let alert = UIAlertController(title: "Error Retrieving Data", message: "Message: \(error.localizedDescription)", preferredStyle: .Alert)
                let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
                alert.addAction(action)
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.presentViewController(alert, animated: true, completion: { () -> Void in
                        self.activityIndicator.stopAnimating()
                        self.activityIndicator.hidden = true
                    })
                })
            } else {
                if let representatives = representatives {
                    if representatives.count > 0 {
                        RepresentativeController.sharedInstance.myRepresentatives = representatives
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            self.performSegueWithIdentifier("toListView", sender: self)
                            self.activityIndicator.stopAnimating()
                            self.activityIndicator.hidden = true
                        })
                    } else {
                        print("Error searching for reps")
                    }
                }
            }
        }
    }
    
    //MARK: - PickerView Data Source
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.states.count
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //MARK: - PickerView Delegate
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.states[row]
    }
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toListView" {
            let _ = segue.destinationViewController as! RepresentativeListTableViewController
        }
    }
    

}
