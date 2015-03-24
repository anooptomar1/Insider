//
//  CompanyGrowth.swift
//  CrunchMobile
//
//  Created by Anoop tomar on 3/21/15.
//  Copyright (c) 2015 codepathaja. All rights reserved.
//

import Foundation

class CompanyGrowth{
    var GrowthRate: Int?
    var Votes: Int?
    var CompId: Int?
    
    init(growth: Int, votes: Int, compId: Int){
        self.GrowthRate = growth
        self.Votes = votes
        self.CompId = compId
    }
}