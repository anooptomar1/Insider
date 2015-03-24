//
//  MainTableViewCell.swift
//  CrunchMobile
//
//  Created by Anoop tomar on 3/19/15.
//  Copyright (c) 2015 codepathaja. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var companyLogo: UIImageView!
    @IBOutlet weak var companyName: UILabel!
    
    @IBOutlet weak var ipoInfo: UILabel!
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var founderInfo: UILabel!
    @IBOutlet weak var foundedOn: UILabel!
    @IBOutlet weak var employeeNumber: UILabel!
    @IBOutlet weak var webAddress: UILabel!
    @IBOutlet weak var companyDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainView.layer.cornerRadius = 12
        self.mainView.clipsToBounds = true
        
        self.companyLogo.layer.cornerRadius = 12
        self.companyLogo.clipsToBounds = true
        self.companyDesc.preferredMaxLayoutWidth = self.companyDesc.frame.size.width
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupCell(company: CompanyData){
        self.companyLogo.setImageWithURL(NSURL(string: company.profileImage!))
        self.companyName.text = company.companyName
        self.ipoInfo.text = company.companyLoc
        self.founderInfo.text = company.founders
        self.foundedOn.text = company.foundedOn
        self.employeeNumber.text = "\(company.numberOfEmployees!)"
        self.webAddress.text = company.webLabel
        self.companyDesc.text = company.shortDesc
    }
    
   
    
}
