//
//  AppDelegate.swift
//  CrunchMobile
//
//  Created by Jianfeng Ye on 3/9/15.
//  Copyright (c) 2015 codepathaja. All rights reserved.
//

import UIKit

let barColor = UIColor(red: 35 / 255, green: 47 / 255, blue: 66 / 255, alpha: 1)
let barTextColor = UIColor.whiteColor()


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        FBLoginView.self
        FBProfilePictureView.self
        
        SampleStartup()
        return true
    }
    
    func SampleStartup(){
        var storyBoard = UIStoryboard(name: "SampleSB", bundle: nil)
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        if(FBSession.activeSession().state == FBSessionState.CreatedTokenLoaded ||  FBSession.activeSession().state == FBSessionState.Open){
        
            var mainVC = storyBoard.instantiateViewControllerWithIdentifier("mainVC") as MainViewController
            let naviController = UINavigationController(rootViewController: mainVC)
            naviController.navigationBar.topItem?.title = "Crunch Insignt"
            
            naviController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: barTextColor]
            naviController.navigationBar.tintColor = barTextColor
            //naviController.navigationBar.backgroundColor = naviColor
            naviController.navigationBar.barTintColor = barColor
            
            
            self.window?.rootViewController = naviController
        }else{
            let loginVC = storyBoard.instantiateViewControllerWithIdentifier("loginVC") as LoginViewController
            self.window?.rootViewController = loginVC
        }
        
    }
    
    func JeffLogic(){
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let companyTableView = CompanyTableViewController(nibName: "CompanyTableViewController", bundle: nil)
        let naviController = UINavigationController(rootViewController: companyTableView)
        naviController.navigationBar.topItem?.title = "The Insider"
        
        naviController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: barTextColor]
        naviController.navigationBar.tintColor = barTextColor
        //naviController.navigationBar.backgroundColor = naviColor
        naviController.navigationBar.barTintColor = barColor
        
        window?.rootViewController = naviController
        window?.makeKeyAndVisible()
    }

    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
        //var opened = FBAppCall.handleOpenURL(url, sourceApplication: sourceApplication)
        //println("openurl called")
        var handled = FBAppCall.handleOpenURL(url, sourceApplication: sourceApplication)
        SampleStartup()
        return handled
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

