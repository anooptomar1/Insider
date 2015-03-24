//
//  CompanyTableViewController.swift
//  CrunchMobile
//
//  Created by Jianfeng Ye on 3/9/15.
//  Copyright (c) 2015 codepathaja. All rights reserved.
//

import UIKit

class CompanyTableViewController: UITableViewController {
    
    var data = [Company]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
       // self.tableView.contentInset = UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0)
        
        self.tableView.registerNib(UINib(nibName: "CompanyTableViewCell", bundle: nil), forCellReuseIdentifier: "CompanyCell")
        
        var headerFrame = CGRectMake(0, 0, self.tableView.frame.width, self.tableView.frame.height - 300)
        var headerImage = UIImageView(image: UIImage(named: "IMG_0055")!)
        headerImage.contentMode = UIViewContentMode.ScaleAspectFill
        headerImage.bounds = CGRect(x: 0, y: 0, width: headerFrame.width, height: headerFrame.height)
        self.tableView.tableHeaderView = headerImage
        
        //data = MockData.CompanyMockData()
        reloadDataFromNetwork()
    }
    
    
    func reloadDataFromNetwork(){
        CrunchClient.getOrgList(0, count: 10) { (companies) -> () in
            self.data = companies!
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return data.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CompanyCell", forIndexPath: indexPath) as CompanyTableViewCell
        
        cell.setupCell(data[indexPath.row])

        return cell
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailsView = CompanyDetailViewController(nibName: "CompanyDetailViewController", bundle: nil)
        let gossipView = CompanyGossipViewController(nibName: "CompanyGossipViewController", bundle: nil)
        
        detailsView.company = data[indexPath.row]
        
        let tabView = UITabBarController()
        tabView.viewControllers = [detailsView, gossipView]
        var gossipItem = UITabBarItem(title: "Gossip", image: UIImage(named: "leisure4"), tag: 0)
        var detailsItem = UITabBarItem(title: "Info", image: UIImage(named: "tie1"), tag: 1)

        gossipView.tabBarItem = gossipItem
        detailsView.tabBarItem = detailsItem
        tabView.tabBar.barTintColor = barColor
        tabView.tabBar.tintColor = barTextColor
//        var navController = UINavigationController(rootViewController: tabView)
//        
//        navController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: barTextColor]
//        navController.navigationBar.tintColor = barTextColor
//        navController.navigationBar.barTintColor = barColor
        
        //let company = Company(name: "Company \(indexPath.row)")
        //detailsView.company = company
      // self.navigationController?.pushViewController(navController, animated: true)
        self.navigationController?.presentViewController(tabView, animated: true, completion: nil)
    }
}
