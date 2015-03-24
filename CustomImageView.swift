//
//  CustomImageView.swift
//  CrunchMobile
//
//  Created by Anoop tomar on 3/22/15.
//  Copyright (c) 2015 codepathaja. All rights reserved.
//

import UIKit


class CustomImageView: UIImageView {
    
    let progressIndicatorView = CircularLoaderView(frame: CGRectZero)
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        addSubview(self.progressIndicatorView)
        progressIndicatorView.frame = bounds
        progressIndicatorView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        
        let seconds = 4.0
        let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
        var dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        
        dispatch_after(dispatchTime, dispatch_get_main_queue(), {
            
            // here code perfomed with delay
            
        })
        
//        
//        let url = NSURL(string: "http://www.raywenderlich.com/wp-content/uploads/2015/02/mac-glasses.jpeg")
//        sd_setImageWithURL(url, placeholderImage: nil, options: .CacheMemoryOnly, progress: {
//            [weak self]
//            (receivedSize, expectedSize) -> Void in
//            self!.progressIndicatorView.progress = CGFloat(receivedSize)/CGFloat(expectedSize)
//            }) {
//                [weak self]
//                (image, error, _, _) -> Void in
//                self!.progressIndicatorView.reveal()
//        }
    }
    
}