//
//  CompanyStock.swift
//  CrunchMobile
//
//  Created by Anoop tomar on 3/21/15.
//  Copyright (c) 2015 codepathaja. All rights reserved.
//

import Foundation

class CompanyStock{
    var StockPrice: Double
    var Votes: Int
    var CompId: Int
    
    init(stock: Double, votes: Int, compId: Int){
        self.StockPrice = stock
        self.Votes = votes
        self.CompId = compId
    }
}