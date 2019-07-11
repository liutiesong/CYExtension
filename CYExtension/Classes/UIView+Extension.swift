//
//  UIView+Extension.swift
//  CyBasic
//
//  Created by 刘铁崧 on 2019/4/30.
//  Copyright © 2019 com. BDDemo.bd. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    class func addBorder(borderWith:CGFloat,borderColor:UIColor)
    {
        func loadFromNib(nibName: String) -> UIView? {
            let view = Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)?.first as! UIView
            view.layer.borderColor = borderColor.cgColor
            view.layer.borderWidth = borderWith
            return view
        }
        
        
//        self.init().layer.borderColor = borderColor.cgColor
//        self.init().layer.borderWidth = borderWith
        
//        self.init().layerr.borderColor=borderColor.cgColor
//        self.init().layerr.borderWidth=borderWith
    }
    
    
//    func addAnimation(type:CATransitionType,key:NSString?,duration:CFTimeInterval,timingFunction:CAMediaTimingFunctionName,repeatCount:Float?,repeateDuration:CFTimeInterval?)
//    {
//        let animation = CATransition()
//        animation.duration = 2
//        animation.repeatCount = repeatCount ?? 0
//        animation.repeatDuration = repeateDuration ?? 0
//        animation.duration = duration
//        animation.timingFunction = CAMediaTimingFunction(name: timingFunction)
//        animation.type = type
//        self.layer.add(animation, forKey: key as String?)
//        //        self.init().layer.borderColor = borderColor.cgColor
//        //        self.init().layer.borderWidth = borderWith
//
//        //        self.init().layerr.borderColor=borderColor.cgColor
//        //        self.init().layerr.borderWidth=borderWith
//    }
    

}
