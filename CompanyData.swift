//
//  CompanyData.swift
//  CrunchMobile
//
//  Created by Anoop tomar on 3/10/15.
//  Copyright (c) 2015 codepathaja. All rights reserved.
//

import UIKit

class CompanyData
{
    var profileImage: String?
    var companyLoc: String?
    var ipoInfo: String?
    var founders: String?
    var numberOfEmployees: String?
    var shortDesc: String?
    var foundedOn: String?
    var webLabel: String?
    var companyName: String?
    var fullDesc: String?
    var stockSym: String?
    // stock data
    var companyValue: CompanyValuation?
    var companyCulture: CompanyCulture?
    var companyGrowth: CompanyGrowth?
    var companyStock: CompanyStock?
    
    var favCompany: Bool?
    
    
    init(profileImage: String, companyLoc: String, ipoInfo: String, founders: String, numberEmployee: String, shortDesc: String,  foundedOn: String, webLabel: String, compName: String, fullD: String, stockS: String,
        companyValuation: CompanyValuation, companyCulture: CompanyCulture, companyGrowth: CompanyGrowth, companyStock: CompanyStock
        ){
        self.profileImage = profileImage
        self.companyLoc = companyLoc
        self.ipoInfo = ipoInfo
        self.founders = founders
        self.numberOfEmployees = numberEmployee
        self.shortDesc = shortDesc
        self.foundedOn = foundedOn
        self.webLabel = webLabel
        self.fullDesc = fullD
        self.stockSym = stockS
        self.companyName = compName
        self.companyValue = companyValuation
        self.companyCulture = companyCulture
        self.companyGrowth = companyGrowth
        self.companyStock = companyStock
        self.favCompany = false
    }
    
    class func ConvertToCompanyData(compArray: [NSDictionary]) -> [CompanyData]{
        
        var companies = [CompanyData]()
        
        for comp in compArray{
            var proImg = comp["Cprimary_image"] as NSString
            var compLo = comp["Cheadquarters"] as NSString
            var ipo = comp["Cipo"] as NSString
            var found = comp["Cfounders"] as NSString
            var numEmp = comp["Cnumber_of_employees"] as Int
            var des = comp["Cshort_description"] as NSString
            var foundOn = comp["Cfounded_on"] as NSString
            var url = comp["Chomepage_url"] as NSString
            var compName = comp["Cname"] as NSString
            var fullD = comp["Cdescription"] as NSString
            var stockS = comp["Cstock_symbol"] as NSString
            
            // valuation
            //(comp["OrgValuations"] as NSArray)[0] as NSDictionary
            var valuationData = (comp["OrgValuations"] as NSArray)[0] as NSDictionary
            var valuationNumber = valuationData["Valuation"] as Double
            var valueVotes = valuationData["Votes"] as Int
            var valueId = valuationData["ID"] as Int
            var valuation = CompanyValuation(valuation: valuationNumber, votes: valueVotes, compId: valueId)
            
            // clulture
            //(comp["OrgCultures"] as NSArray)[0] as NSDictionary
            var clultureData = (comp["OrgCultures"] as NSArray)[0] as NSDictionary
            var cultureNumber = clultureData["Culture"] as Int
            var cultureVotes = clultureData["Votes"] as Int
            var cultureId = clultureData["ID"] as Int
            var culture = CompanyCulture(culture: cultureNumber, votes: cultureVotes, compId: cultureId)
            
            // growth
            //(comp["OrgGrowths"] as NSArray)[0] as NSDictionary
            var growthData = (comp["OrgGrowths"] as NSArray)[0] as NSDictionary
            var growthNumber = growthData["Growth"] as Int
            var growthVotes = growthData["Votes"] as Int
            var growthId = growthData["ID"] as Int
            var growth = CompanyGrowth(growth: growthNumber, votes: growthVotes, compId: growthId)
            
            // Stocks
            //(comp["OrgStocks"] as NSArray)[0] as NSDictionary
            var stocksData = (comp["OrgStocks"] as NSArray)[0] as NSDictionary
            var stocksNumber = stocksData["StockPrice"] as Double
            var stocksVotes = stocksData["Votes"] as Int
            var stocksId = stocksData["ID"] as Int
            var stocks = CompanyStock(stock: stocksNumber, votes: stocksVotes, compId: stocksId)
            
            //println(proImg)
            companies.append(CompanyData(profileImage: proImg, companyLoc: compLo, ipoInfo: ipo, founders: found, numberEmployee: "\(numEmp)", shortDesc: des, foundedOn: foundOn, webLabel: url, compName: compName, fullD: fullD, stockS: stockS, companyValuation: valuation, companyCulture: culture, companyGrowth: growth, companyStock: stocks))
        }
        
        //println(compArray)
        
        return companies
    }

}
