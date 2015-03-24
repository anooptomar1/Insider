//
//  CompanyTableViewCell.swift
//  CrunchMobile
//
//  Created by Jianfeng Ye on 3/9/15.
//  Copyright (c) 2015 codepathaja. All rights reserved.
//

import UIKit

class CompanyTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var companyLoc: UILabel!
    @IBOutlet weak var ipoInfo: UILabel!
    @IBOutlet weak var founders: UILabel!
    @IBOutlet weak var acuisitions: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var catLabel: UILabel!
    @IBOutlet weak var webLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.profileImage.layer.cornerRadius = 5
        self.profileImage.clipsToBounds = true
        self.cardView.layer.cornerRadius = 5
        self.selectionStyle = UITableViewCellSelectionStyle.None
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setupCell(company: Company){
        self.profileImage.setImageWithURL(NSURL(string: company.profileImage!))
        self.companyLoc.text = company.companyLoc
        self.ipoInfo.text = company.ipoInfo
        self.founders.text = company.founders
        self.acuisitions.text = company.acuisitions
        self.desc.text = company.desc
        self.catLabel.text = company.foundedOn
        self.webLabel.text = company.webLabel
    }
}
