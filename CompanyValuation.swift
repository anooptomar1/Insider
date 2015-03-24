//
//  CompanyValuation.swift
//  CrunchMobile
//
//  Created by Anoop tomar on 3/21/15.
//  Copyright (c) 2015 codepathaja. All rights reserved.
//

import Foundation

class CompanyValuation{
    var Valuation: Double
    var Votes: Int
    var CompId: Int
    
    init(valuation: Double, votes: Int, compId: Int){
        self.Valuation = valuation
        self.Votes = votes
        self.CompId = compId
    }
}