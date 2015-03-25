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

    @IBOutlet weak var valueationView: SpringView!
    @IBOutlet weak var trendingView: SpringView!
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
        valueationView.hidden = true
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
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        animateView(valueationView)
    }
    
    func animateView(view: SpringView){
        view.hidden = false
        view.force = 1.0
        view.duration = 0.5
        view.delay = 0
        
        view.damping = 1.0
        view.velocity = 1.0
        view.scaleX = 1.0
        view.scaleY = 1.0
        view.x = 0
        view.y = 0
        view.rotate = 100
        
        view.animation = "zoomIn"
        view.curve = "spring"
        view.animate()
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
