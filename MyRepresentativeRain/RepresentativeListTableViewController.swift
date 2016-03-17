//
//  RepresentativeListTableViewController.swift
//  MyRepresentativeRain
//
//  Created by Zach Steed on 3/17/16.
//  Copyright © 2016 Steedz. All rights reserved.
//

import UIKit

class RepresentativeListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RepresentativeController.sharedInstance.myRepresentatives.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("repCell", forIndexPath: indexPath)

        let representative = RepresentativeController.sharedInstance.myRepresentatives[indexPath.row]
        
        cell.textLabel?.text = representative.name
        cell.detailTextLabel?.text = representative.party

        return cell
    }
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toDetailView" {
            if let detailViewController = segue.destinationViewController as? RepresentativeDetailViewController {
                _ = detailViewController.view
                let indexPath = tableView.indexPathForSelectedRow
                if let selectedRow = indexPath?.row {
                    let representative = RepresentativeController.sharedInstance.myRepresentatives[selectedRow]
                    detailViewController.updateWithRepresentative(representative)
                }
            }
        }
    }
    

}



