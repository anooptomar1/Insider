//
//  ValueStockViewController.swift
//  CrunchMobile
//
//  Created by Anoop tomar on 3/23/15.
//  Copyright (c) 2015 codepathaja. All rights reserved.
//

import UIKit
protocol ValueStockViewControllerDelegate: class{
    func didUpdate(valueStockViewController: ValueStockViewController, updated: Bool)
}


class ValueStockViewController: UIViewController {

    @IBOutlet weak var valueationView: UIView!
    @IBOutlet weak var trendingView: UIView!
    @IBOutlet weak var companyName: UILabel!
    
    @IBOutlet weak var smallLogo: UIImageView!
    @IBOutlet weak var currentValue: UILabel!
    
    var fromView: String?
    var company: CompanyData?
    var stepped: Bool?
    
    weak var delegate: ValueStockViewControllerDelegate?
    
    @IBOutlet weak var viewHeader: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRoundCorner(valueationView, radius: 15)
        setRoundCorner(trendingView, radius: 10)
        setRoundCorner(smallLogo, radius: 4)
        stepped = false
        setView()
    }
    
    func setView(){
        self.smallLogo.setImageWithURL(NSURL(string: company!.profileImage!))
        self.currentValue.text = fromView!
        self.companyName.text = company!.companyName!
        self.viewHeader.text = fromView!
        if(fromView! == "Valuation"){
            printFormattedValuation()
        }else{
            printFormattedStockPrice()
        }
    }
    
    func printFormattedValuation(){
        var formattedValuation = NSString(format: "%.2f", company!.companyValue!.Valuation)
        self.currentValue.text = "$\(formattedValuation)M"
    }
    
    func printFormattedStockPrice(){
        var formattedStock = NSString(format: "%.2f", company!.companyStock!.StockPrice)
        self.currentValue.text = "$\(formattedStock)"
    }
    
    @IBAction func onClose(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    func setRoundCorner(view: UIView, radius: CGFloat){
        view.layer.cornerRadius = radius
        view.clipsToBounds = true
    }

    @IBAction func onStepper(sender: UIStepper) {
        
        if(fromView! == "Valuation"){
            if sender.value < 100{
                company!.companyValue!.Valuation -=  0.5
            }else{
                company!.companyValue!.Valuation +=  0.5
            }
            if(!stepped!){
                company!.companyValue!.Votes += 1
                stepped = true
            }
            printFormattedValuation()
        }else{
            if sender.value < 100{
                company!.companyStock!.StockPrice -= 0.5
            }else{
                company!.companyStock!.StockPrice += 0.5
            }
            if(!stepped!){
                company!.companyStock!.Votes += 1
                stepped = true
            }
            printFormattedStockPrice()
        }
        self.delegate?.didUpdate(self, updated: true)
    }
}
