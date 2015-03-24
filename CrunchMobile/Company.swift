//
//  Company.swift
//  CrunchMobile
//
//  Created by Jianfeng Ye on 3/10/15.
//  Copyright (c) 2015 codepathaja. All rights reserved.
//

import Foundation

class Company {
    var profileImage: String?
    var companyLoc: String?
    var ipoInfo: String?
    var founders: String?
    var acuisitions: String?
    var desc: String?
    var foundedOn: String?
    var webLabel: String?
    var companyName: String?
    var fullDesc: String?
    var stockSym: String?
    
    init(profileImage: String, companyLoc: String, ipoInfo: String, founders: String, acuisitions: String, desc: String,  foundedOn: String, webLabel: String, compName: String, fullD: String, stockS: String){
        self.profileImage = profileImage
        self.companyLoc = companyLoc
        self.ipoInfo = ipoInfo
        self.founders = founders
        self.acuisitions = acuisitions
        self.desc = desc
        self.foundedOn = foundedOn
        self.webLabel = webLabel
        self.fullDesc = fullD
        self.stockSym = stockS
    }
    
    class func ConvertToCompanyData(compArray: [NSDictionary]) -> [Company]{
        
        var companies = [Company]()
        
        for comp in compArray{
            var proImg = comp["Cprimary_image"] as NSString
            var compLo = comp["Cheadquarters"] as NSString
            var ipo = comp["Cipo"] as NSString
            var found = comp["Cfounders"] as NSString
            var acq = comp["Cnumber_of_employees"] as Int
            var des = comp["Cshort_description"] as NSString
            var foundOn = comp["Cfounded_on"] as NSString
            var url = comp["Chomepage_url"] as NSString
            var compName = comp["Cname"] as NSString
            var fullD = comp["Cdescription"] as NSString
            var stockS = comp["Cstock_symbol"] as NSString
            println(proImg)
            companies.append(Company(profileImage: proImg, companyLoc: compLo, ipoInfo: ipo, founders: found, acuisitions: "\(acq)", desc: des, foundedOn: foundOn, webLabel: url, compName: compName, fullD: fullD, stockS: stockS))
        }
        
        return companies
    }
}