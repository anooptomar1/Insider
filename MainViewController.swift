//
//  MainViewController.swift
//  CrunchMobile
//
//  Created by Anoop tomar on 3/10/15.
//  Copyright (c) 2015 codepathaja. All rights reserved.
//

import UIKit

class MainViewController: UIViewController{
    
    @IBOutlet weak var searchBar: UISearchBar!
    let progressIndicatorView = CircularLoaderView(frame: CGRectZero)
    
    var tableViewOffset = CGPointZero
    var pageNumber = 0
    let count = 10

    @IBOutlet weak var tableView: UITableView!
    var companyData = [CompanyData]()
    
    var filteredCompany = [CompanyData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.searchBar.delegate = self
        
        println(FBSession.activeSession().permissions)
        
        reloadDataFromNetwork(pageNumber, cnt: count)
        //self.tableView.rowHeight = UITableViewAutomaticDimension;
        //self.tableView.backgroundColor = UIColor.whiteColor()
        self.tableView.estimatedRowHeight = 45
       // self.tableView.rowHeight = UITableViewAutomaticDimension
        tableView.addInfiniteScrollingWithActionHandler(insertMore)
       // addTableHeader()
        self.view.addSubview(self.progressIndicatorView)
        self.progressIndicatorView.frame = self.view.bounds
        self.progressIndicatorView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        //self.progressIndicatorView.progress = 0.2
      }
    
    func reloadDataFromNetwork(pgNumber: Int, cnt: Int){
        SVProgressHUD.show()
        CrunchClient.getCompanyList(pgNumber, count: cnt) { (companies) -> () in
            if(pgNumber == 0){
                self.progressIndicatorView.reveal()
                self.progressIndicatorView.removeFromSuperview()
            }
            self.companyData.extend(companies!)
            self.tableView.reloadData()
            self.tableView.infiniteScrollingView.stopAnimating()
            SVProgressHUD.dismiss()
        }
    }
    
    
    func insertMore(){
        pageNumber += count
        reloadDataFromNetwork(pageNumber, cnt: count)
    }
    
    func addTableHeader(){
        var headerFrame = CGRectMake(0, 0, self.tableView.frame.width, self.tableView.frame.height - 300)
        var headerImage = UIImageView(image: UIImage(named: "IMG_0055")!)
        headerImage.contentMode = UIViewContentMode.ScaleAspectFill
        headerImage.bounds = CGRect(x: 0, y: 0, width: headerFrame.width, height: headerFrame.height)
        self.tableView.tableHeaderView = headerImage
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.rowHeight = UITableViewAutomaticDimension;
//        if(self.tableViewOffset.y != self.tableView.contentOffset.y){
//            UIView.animateWithDuration(0.5, animations: {
//                self.tableView.contentOffset = self.tableViewOffset
//            }, completion: { (finished) -> Void in
//                self.tableViewOffset = CGPointZero
//            })
//        }
    }

    @IBAction func onMenuButton(sender: UIBarButtonItem) {
        let loginVC = self.storyboard?.instantiateViewControllerWithIdentifier("loginVC") as LoginViewController
        presentViewController(loginVC, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.tableViewOffset = self.tableView.contentOffset
        var destVC = segue.destinationViewController as DetailsViewController
        var indexPath = self.tableView.indexPathForSelectedRow()
        if(filteredCompany.count > 0){
            destVC.company = filteredCompany[indexPath!.row]
        }else{
            destVC.company = companyData[indexPath!.row]
        }
        
        println(companyData[indexPath!.row].companyCulture!.CulturePercent)
    }
}

extension MainViewController: UITableViewDataSource{
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("tableCell", forIndexPath: indexPath) as MainTableViewCell
    
        if(filteredCompany.count > 0){
            cell.setupCell(filteredCompany[indexPath.row])
        }else{
            cell.setupCell(companyData[indexPath.row])
        }
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(filteredCompany.count > 0){
            return filteredCompany.count
        }else{
            return companyData.count
        }
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
   
    func scrollViewDidScroll(scrollView: UIScrollView) {
        searchBar.resignFirstResponder();
    }
}

extension MainViewController: UITableViewDelegate{

}

extension MainViewController: UISearchBarDelegate{
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        filteredCompany = searchText.isEmpty ? [CompanyData]() : companyData.filter({ (comp: CompanyData) -> Bool in
            println(comp.companyName!)
            return comp.companyName?.rangeOfString(searchText) != nil
        })
        
        self.tableView.reloadData()
    }
}

