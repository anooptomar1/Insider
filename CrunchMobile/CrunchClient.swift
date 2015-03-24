//
//  CrunchClient.swift
//  CrunchMobile
//
//  Created by Anoop tomar on 3/12/15.
//  Copyright (c) 2015 codepathaja. All rights reserved.
//

import UIKit

class CrunchClient{

    class var SharedInstance: AFHTTPRequestOperationManager{
        return AFHTTPRequestOperationManager()
    }
    
    class func getOrgList(skip: Int, count: Int, completion: (companies: [Company]?) -> ()){
        CrunchClient.SharedInstance.GET(sharedVariables.apiBaseUrl+"info?skip=\(skip)&count=\(count)", parameters: nil, success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            var results = response as NSArray
                var companies = Company.ConvertToCompanyData(results as [NSDictionary])
                //println(results)
                completion(companies: companies)
            }, failure: {(operation: AFHTTPRequestOperation!, error:NSError!) -> Void in
            
            })
        
    }
    
    class func getCompanyList(skip: Int, count: Int, completion: (companies: [CompanyData]?) -> ()){
        CrunchClient.SharedInstance.GET(sharedVariables.apiBaseUrl+"info?skip=\(skip)&count=\(count)", parameters: nil, success: { (operation:AFHTTPRequestOperation!, response: AnyObject!) -> Void in
                var companies = CompanyData.ConvertToCompanyData((response as NSArray) as [NSDictionary])
                completion(companies: companies)
            }) { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
            
        }
    }
}

