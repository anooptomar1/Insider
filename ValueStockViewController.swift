//
//  ValueStockViewController.swift
//  CrunchMobile
//
//  Created by Anoop tomar on 3/23/15.
//  Copyright (c) 2015 codepathaja. All rights reserved.
//

import UIKit

class ValueStockViewController: UIViewController {

    @IBOutlet weak var valueationView: UIView!
    @IBOutlet weak var trendingView: UIView!
    @IBOutlet weak var companyName: UILabel!
    
    @IBOutlet weak var smallLogo: UIImageView!
    @IBOutlet weak var currentValue: UILabel!
    
    var fromView: String?
    var company: CompanyData?
    
    @IBOutlet weak var viewHeader: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRoundCorner(valueationView, radius: 15)
        setRoundCorner(trendingView, radius: 10)
        setRoundCorner(smallLogo, radius: 4)
        
        setView()
    }
    
    func setView(){
        self.smallLogo.setImageWithURL(NSURL(string: company!.profileImage!))
        self.currentValue.text = fromView!
        self.companyName.text = company!.companyName!
        self.viewHeader.text = fromView!
        if(fromView! == "Valuation"){
            self.currentValue.text = "\(company!.companyValue!.Valuation)"
        }else{
            self.currentValue.text = "\(company!.companyStock!.StockPrice)"
        }
    }
    
    
    
    @IBAction func onClose(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    func setRoundCorner(view: UIView, radius: CGFloat){
        view.layer.cornerRadius = radius
        view.clipsToBounds = true
    }

    @IBAction func onStepper(sender: UIStepper) {
    }
}
