//
//  CompanyCulture.swift
//  CrunchMobile
//
//  Created by Anoop tomar on 3/21/15.
//  Copyright (c) 2015 codepathaja. All rights reserved.
//

import Foundation

class CompanyCulture{
    var CulturePercent: Int
    var Votes: Int
    var CompId: Int
    
    init(culture: Int, votes: Int, compId: Int){
        self.CulturePercent = culture
        self.Votes = votes
        self.CompId = compId
    }
}