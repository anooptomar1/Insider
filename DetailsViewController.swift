//
//  DetailsViewController.swift
//  CrunchMobile
//
//  Created by Anoop tomar on 3/20/15.
//  Copyright (c) 2015 codepathaja. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var smallLogo: UIImageView!
    @IBOutlet weak var dialogView: UIView!
    @IBOutlet weak var stockView: UIView!
    @IBOutlet weak var valueView: UIView!
    @IBOutlet weak var workView: UIView!
    @IBOutlet weak var growthView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var comparyName: UILabel!
    @IBOutlet weak var founderName: UILabel!
    @IBOutlet weak var foundedOn: UILabel!
    @IBOutlet weak var employees: UILabel!
    @IBOutlet weak var website: UILabel!
    
    @IBOutlet weak var circleChartTest: UIView!
    @IBOutlet weak var workCircleView: UIView!
    @IBOutlet weak var valuationCount: UILabel!
    @IBOutlet weak var stockCount: UILabel!
    @IBOutlet weak var growthCount: UILabel!
    @IBOutlet weak var workCount: UILabel!
    
    var circleChart: PNCircleChart?
    var workCircleChart: PNCircleChart?
    
    // valuation
    @IBOutlet weak var valuationLabel: UILabel!
    
    // stock
    @IBOutlet weak var stockLabel: UILabel!
    
    // growth
    @IBOutlet weak var growthLabel: UILabel!
    
    // culture
    @IBOutlet weak var workLabel: UILabel!
    
    var company: CompanyData?
    var textColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRoundCorner(dialogView, radius: 15)
        setRoundCorner(stockView, radius: 10)
        setRoundCorner(valueView, radius: 10)
        setRoundCorner(workView, radius: 10)
        setRoundCorner(growthView, radius: 10)
        setRoundCorner(profileImage, radius: 4)
        setRoundCorner(smallLogo, radius: 4)
        
        textColor = valuationLabel.textColor
        
        setupCells()
        
        setupCircleChart()
        setupWorkCircle()
    }
    
    func setupWorkCircle(){
        self.workCircleChart = PNCircleChart(frame: CGRectMake(0, 0, workCircleView.frame.width, workCircleView.frame.height), total: 100, current: 0, clockwise: true)
        //PNCircleChart(frame: CGRectMake(0, 0, circleChartTest.frame.width, circleChartTest.frame.height))
        self.workCircleChart?.backgroundColor = UIColor.clearColor()
        self.workCircleChart?.strokeColor = textColor
        self.workCircleChart?.countingLabel.font = UIFont(name: "Times", size: 14)
        self.workCircleChart?.countingLabel.textColor = textColor
        self.workCircleChart?.strokeChart()
        self.workCircleChart?.circleBackground.strokeColor = dialogView.backgroundColor?.CGColor
        
        self.workCircleView.addSubview(self.workCircleChart!)
        
        self.workCircleChart?.updateChartByCurrent(company?.companyCulture?.CulturePercent)
    }
    func setupCircleChart(){
        self.circleChart = PNCircleChart(frame: CGRectMake(0, 0, circleChartTest.frame.width, circleChartTest.frame.height), total: 100, current: 0, clockwise: true)
            //PNCircleChart(frame: CGRectMake(0, 0, circleChartTest.frame.width, circleChartTest.frame.height))
        self.circleChart?.backgroundColor = UIColor.clearColor()
        self.circleChart?.strokeColor = textColor
        self.circleChart?.countingLabel.font = UIFont(name: "Times", size: 14)
        self.circleChart?.countingLabel.textColor = textColor
        self.circleChart?.strokeChart()
        self.circleChart?.circleBackground.strokeColor = dialogView.backgroundColor?.CGColor
        
        self.circleChartTest.addSubview(self.circleChart!)
        
        self.circleChart?.updateChartByCurrent(company?.companyGrowth?.GrowthRate)
    }
    
    func setupCells(){
        self.comparyName.text = company?.companyName
        self.profileImage.setImageWithURL(NSURL(string: company!.profileImage!))
        self.smallLogo.setImageWithURL(NSURL(string: company!.profileImage!))
        self.founderName.text = company?.founders
        self.foundedOn.text = company?.foundedOn
        self.employees.text = "\(company!.numberOfEmployees!)"
        self.website.text = company?.webLabel
        var formattedValuation = NSString(format: "%.2f", company!.companyValue!.Valuation)
        self.valuationLabel.text = "$\(formattedValuation)M"
        
        var formattedStock = NSString(format: "%.2f", company!.companyStock!.StockPrice)
        self.stockLabel.text = "$\(formattedStock)"
        let growth = company?.companyGrowth?.GrowthRate!
        self.growthLabel.text = "\(growth!)%"
        let culture = company?.companyCulture?.CulturePercent
        self.workLabel.text = "\(culture!)%"
        self.valuationCount.text = "\(company!.companyValue!.Votes) votes"
        self.stockCount.text = "\(company!.companyStock!.Votes) votes"
        self.growthCount.text = "\(company!.companyGrowth!.Votes!) votes"
        self.workCount.text = "\(company!.companyCulture!.Votes) votes"
    }
    
    func setRoundCorner(view: UIView, radius: CGFloat){
        view.layer.cornerRadius = radius
        view.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissDialog(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    
    @IBAction func onGrowthLike(sender: UIButton) {
        //Growth-outlook(N+1) = [N*Growth-outlook(N)+1]/(N+1)
        //println("B-Incr GR: \(company!.companyGrowth!.GrowthRate!) Votes: \(company!.companyGrowth!.Votes!) ")
        var newGrowthRate: Double = Double((company!.companyGrowth!.GrowthRate!) * (company!.companyGrowth!.Votes!) + 100)
        company!.companyGrowth!.Votes! += 1
        company!.companyGrowth!.GrowthRate! = Int(round(newGrowthRate/Double(company!.companyGrowth!.Votes!)))
        
        //company!.companyGrowth!.GrowthRate! = (((company!.companyGrowth!.GrowthRate!) * (company!.companyGrowth!.Votes!) + 100)/(company!.companyGrowth!.Votes! + 1))
        // println("P-Incr GR: \(company!.companyGrowth!.GrowthRate!) Votes: \(company!.companyGrowth!.Votes!) ")
        self.growthCount.text = "\(company!.companyGrowth!.Votes!) votes"
        self.circleChart?.updateChartByCurrent(company?.companyGrowth?.GrowthRate)
        self.circleChart?.updateChartByCurrent(company?.companyGrowth?.GrowthRate)
        //println("P-Incr GR: \(company!.companyGrowth!.GrowthRate)")
    }
    
    
    @IBAction func onGrowthUnlike(sender: UIButton) {
        //Growth-outlook(N+1) = [N*Growth-outlook(N)-1]/(N+1)
        // println("B-Decr GR: \(company!.companyGrowth!.GrowthRate!) Votes: \(company!.companyGrowth!.Votes!) ")
        var newGrowthRate: Double = Double((company!.companyGrowth!.GrowthRate!) * (company!.companyGrowth!.Votes!) - 100)
        company!.companyGrowth!.Votes! += 1
        company!.companyGrowth!.GrowthRate! = Int(round(newGrowthRate/Double(company!.companyGrowth!.Votes!)))
        
        //company!.companyGrowth!.GrowthRate! = (((company!.companyGrowth!.GrowthRate!) * (company!.companyGrowth!.Votes!) - 100)/(company!.companyGrowth!.Votes! + 1))
        
        // println("P-Decr GR: \(company!.companyGrowth!.GrowthRate!) Votes: \(company!.companyGrowth!.Votes!) ")
        
        self.growthCount.text = "\(company!.companyGrowth!.Votes!) votes"
        self.circleChart?.updateChartByCurrent(company?.companyGrowth?.GrowthRate)
    }

    
    @IBAction func onWorkLike(sender: UIButton) {
        // Work-culture(N+1) = [N* Work-culture(N)+1]/(N+1)
        //     company!.companyCulture!.CulturePercent = ((company!.companyCulture!.CulturePercent) * (company!.companyCulture!.Votes) + 1)/(company!.companyCulture!.Votes + 1)
        var newCulture: Double = Double((company!.companyCulture!.CulturePercent) * (company!.companyCulture!.Votes) + 100)
        company!.companyCulture!.Votes += 1
        company!.companyCulture!.CulturePercent = Int(round(newCulture/Double(company!.companyCulture!.Votes)))
        
        self.workCount.text = "\(company!.companyCulture!.Votes) votes"
        self.workCircleChart?.updateChartByCurrent(company!.companyCulture!.CulturePercent)
        self.workCircleChart?.updateChartByCurrent(company!.companyCulture!.CulturePercent)
    }
 
   
    @IBAction func onWorkUnlike(sender: UIButton) {
    // Work-culture (N+1) = [N* Work-culture(N)-1]/(N+1)
    //       company!.companyCulture!.CulturePercent = ((company!.companyCulture!.CulturePercent) * (company!.companyCulture!.Votes) - 1)/(company!.companyCulture!.Votes + 1)
    //        company!.companyCulture!.Votes += 1
    var newCulture: Double = Double((company!.companyCulture!.CulturePercent) * (company!.companyCulture!.Votes) - 100)
    company!.companyCulture!.Votes += 1
    company!.companyCulture!.CulturePercent = Int(round(newCulture/Double(company!.companyCulture!.Votes)))
    
    
    self.workCount.text = "\(company!.companyCulture!.Votes) votes"
    self.workCircleChart?.updateChartByCurrent(company!.companyCulture!.CulturePercent)
    self.workCircleChart?.updateChartByCurrent(company!.companyCulture!.CulturePercent)
    }
    
    @IBAction func onValuationLike(sender: UIButton) {
    }
    
    @IBAction func onValuationUnlike(sender: UIButton) {
    }
    
    
    @IBAction func onStockLike(sender: UIButton) {
    }
    
    
    @IBAction func onStockUnlike(sender: UIButton) {
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var nextVC = segue.destinationViewController as ValueStockViewController
        nextVC.company = company
        if(segue.identifier == "valuationSegue"){
            nextVC.fromView = "Valuation"
        }else if(segue.identifier == "stockSegue"){
            nextVC.fromView = "Stock Price"
        }
    }
}
