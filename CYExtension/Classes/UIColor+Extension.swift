//
//  UIColor+Extension.swift
//  CyBasic
//
//  Created by 刘铁崧 on 2019/4/30.
//  Copyright © 2019 com. BDDemo.bd. All rights reserved.
//

import Foundation
import UIKit


public extension UIColor {
    ///使用16进制色值
    class func colorWithColor16(color:String)->UIColor{
        var cstr = color.trimmingCharacters(in:  CharacterSet.whitespacesAndNewlines).uppercased() as NSString;
        if(cstr.length < 6){
            return UIColor.clear;
        }
        if(cstr.hasPrefix("0X")){
            cstr = cstr.substring(from: 2) as NSString
        }
        if(cstr.hasPrefix("#")){
            cstr = cstr.substring(from: 1) as NSString
        }
        if(cstr.length != 6){
            return UIColor.clear;
        }
        var range = NSRange.init()
        range.location = 0
        range.length = 2
        //r
        let rStr = cstr.substring(with: range);
        //g
        range.location = 2;
        let gStr = cstr.substring(with: range)
        //b
        range.location = 4;
        let bStr = cstr.substring(with: range)
        var r :UInt32 = 0x0;
        var g :UInt32 = 0x0;
        var b :UInt32 = 0x0;
        Scanner.init(string: rStr).scanHexInt32(&r);
        Scanner.init(string: gStr).scanHexInt32(&g);
        Scanner.init(string: bStr).scanHexInt32(&b);
        return UIColor.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1);
    }
    
    ///生成随机色值
    @objc class var randomColor: UIColor {
        get {
            let red = CGFloat(arc4random()%256)/255.0
            let green = CGFloat(arc4random()%256)/255.0
            let blue = CGFloat(arc4random()%256)/255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
    
    
    //通过RGB来设置 不带透明度
    @objc class func RGB(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
        
        return RGBAndAlpha(r, g, b, 1.0)
        
    }
    
    //通过RGB来设置 带透明度
    @objc class func RGBAndAlpha(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) -> UIColor {
        
        return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
        
    }
    
    
    //16进制换算成color 无透明度
    @objc class func colorWithHexs(hexColor: Int) -> UIColor {
        
        return UIColor.colorWithHexs(hexColor: hexColor, alpha: 1.0)
        
    }
    
    //16进制换算成color 有透明度
    @objc class func colorWithHexs(hexColor: Int, alpha: CGFloat) -> UIColor {
        
        return UIColor(red: ((CGFloat)((hexColor & 0xFF0000) >> 16)) / 255.0,
                       green: ((CGFloat)((hexColor & 0xFF00) >> 8)) / 255.0,
                       blue: ((CGFloat)(hexColor & 0xFF)) / 255.0,
                       alpha: alpha)
    }
    
    

}
