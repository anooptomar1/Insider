//
//  FavViewController.swift
//  CrunchMobile
//
//  Created by Anoop tomar on 3/24/15.
//  Copyright (c) 2015 codepathaja. All rights reserved.
//

import UIKit

class FavViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var companies = [CompanyData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "favDetailSegue"{
            var destVC = segue.destinationViewController as DetailsViewController
            var indexPath = self.tableView.indexPathForSelectedRow()
            destVC.company = companies[indexPath!.row]
            destVC.favHidden = true
        }
    }

}

extension FavViewController: UITableViewDataSource{
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("tableCell", forIndexPath: indexPath) as MainTableViewCell
        cell.setupCell(companies[indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

}

extension FavViewController: UITableViewDelegate{

}



