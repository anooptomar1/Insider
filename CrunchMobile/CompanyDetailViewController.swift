//
//  CompanyDetailViewController.swift
//  CrunchMobile
//
//  Created by Jianfeng Ye on 3/10/15.
//  Copyright (c) 2015 codepathaja. All rights reserved.
//

import UIKit

class CompanyDetailViewController: UIViewController {
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var foundDateLabel: UILabel!
    @IBOutlet weak var foundersLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var employeeNumLabel: UILabel!
    @IBOutlet weak var acquisitionNumLabel: UILabel!
    @IBOutlet weak var ipoInfoLabel: UILabel!
    @IBOutlet weak var desciptionLabel: UILabel!
    
    var company: Company?
    
    @IBAction func onCloseButton(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.logoImage.layer.cornerRadius = 5
        self.logoImage.clipsToBounds = true
        
        if let company = company {
            logoImage.setImageWithURL(NSURL(string: company.profileImage!))
            nameLabel.text = company.companyName  // need data from api
            urlLabel.text = company.webLabel
            locationLabel.text = company.companyLoc
            foundDateLabel.text = company.foundedOn //need data from api
            foundersLabel.text = company.founders
            categoriesLabel.text = "category"
            employeeNumLabel.text = company.acuisitions
            acquisitionNumLabel.text = company.stockSym
            ipoInfoLabel.text = company.ipoInfo
            desciptionLabel.text = company.fullDesc
        }
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }

    func cancelCall(){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
