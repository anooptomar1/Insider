//
//  LoginViewController.swift
//  CrunchMobile
//
//  Created by Anoop tomar on 3/24/15.
//  Copyright (c) 2015 codepathaja. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, FBLoginViewDelegate {
    @IBOutlet weak var closeView: UIView!
    @IBOutlet weak var fbLoginView: FBLoginView!

    override func viewDidLoad() {
        super.viewDidLoad()
        closeView.hidden = true
    }

    
    @IBAction func onCloseButton(sender: UIButton) {
        if(FBSession.activeSession().state == FBSessionState.Closed){
            closeView.hidden = true
            UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
        }else{
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
}
