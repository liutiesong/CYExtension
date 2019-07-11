//
//  NSString+Extension.swift
//  CyBasic
//
//  Created by 刘铁崧 on 2019/4/30.
//  Copyright © 2019 com. BDDemo.bd. All rights reserved.
//

import Foundation
import UIKit

public extension String
{
    /// 字符串倒序排列
    func reverse() -> String
    {
        var arr = Array(self)
        for i in 0..<arr.count / 2 {
            arr.swapAt(i, arr.count - i - 1)
        }
        return String(arr)
    }
    //隐藏字符
    func hideCharacter(range:NSRange,character:Character) -> String
    {
        var str:String = String(character)
        for _ in 0...range.length
        {
            str.append(character)
        }
        return (self as NSString).replacingCharacters(in: range, with: str)
    }
    
    
    //隐藏电话号码
    func hidePhoneNumber34() -> String {
        
        return (self as NSString).replacingCharacters(in: NSMakeRange(3,4), with: "****")
        
    }
    func hidePhoneNumber27() -> String {
        
        return (self as NSString).replacingCharacters(in: NSMakeRange(2,7), with: "*******")
        
    }
    func hideBankCard410() -> String {
        if self.count  == 0 {
            return self
            
        }
        return (self as NSString).replacingCharacters(in: NSMakeRange(4,10), with: "***********")
    }


    
    /// 修改字符颜色样式
    func changeCharacterColor(color:UIColor,range:NSRange) -> NSAttributedString
    {
        let str = NSMutableAttributedString(string: self)
        
        str.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        return str
    }
    /// 修改字符大小样式
    func changeCharacterFontSize(size:CGFloat,range:NSRange,bold:Bool) -> NSAttributedString
    {
        let str = NSMutableAttributedString(string: self)
        let font = bold ? UIFont.boldSystemFont(ofSize: size) : UIFont.systemFont(ofSize: size)
        str.addAttribute(NSAttributedString.Key.font, value: font, range: range)
        return str
    }
    /// 添加描边样式
    func changeCharacterStroke(width:CGFloat,color:UIColor,range:NSRange) -> NSAttributedString
    {
        let str = NSMutableAttributedString(string: self)
        str.addAttribute(NSAttributedString.Key.strokeWidth, value: width, range: range)
        str.addAttribute(NSAttributedString.Key.strokeColor, value: color, range: range)
        return str
    }
    /// 添加下划线样式
    func changeCharacterUnderLine(color:UIColor,style:NSUnderlineStyle,range:NSRange) -> NSAttributedString
    {
//        public static var single: NSUnderlineStyle { get }
//
//        @available(iOS 7.0, *)
//        public static var thick: NSUnderlineStyle { get }
//
//        @available(iOS 7.0, *)
//        public static var double: NSUnderlineStyle { get }
//
//
//        @available(iOS 7.0, *)
//        public static var patternDot: NSUnderlineStyle { get }
//
//        @available(iOS 7.0, *)
//        public static var patternDash: NSUnderlineStyle { get }
//
//        @available(iOS 7.0, *)
//        public static var patternDashDot: NSUnderlineStyle { get }
//
//        @available(iOS 7.0, *)
//        public static var patternDashDotDot: NSUnderlineStyle { get }
//
//
//        @available(iOS 7.0, *)
//        public static var byWord: NSUnderlineStyle { get }        NSUnderlineStyle.single
        let str = NSMutableAttributedString(string: self)
        str.addAttribute(NSAttributedString.Key.underlineStyle, value: style.rawValue, range: range)
        str.addAttribute(NSAttributedString.Key.underlineColor, value: color, range: range)
        return str
    }
    
    /// 添加阴影样式
    func changeCharacterShadow(color:UIColor,offset:CGSize,range:NSRange) -> NSAttributedString
    {
        let str = NSMutableAttributedString(string: self)
        let shadow = NSShadow.init()
        shadow.shadowColor = UIColor.red
        shadow.shadowOffset = CGSize.init(width: 2, height: 2)
        str.addAttribute(NSAttributedString.Key.shadow, value: shadow, range: range)
        return str
    }
    
    /// 添加背景样式
    func changeCharacterBackground(color:UIColor,range:NSRange) -> NSAttributedString
    {
        let str = NSMutableAttributedString(string: self)
        str.addAttribute(NSAttributedString.Key.backgroundColor, value: color, range: range)
        return str
    }
    
    /// 文字添加删除线
    func changeCharacterRemoveLine(color:UIColor,range:NSRange) -> NSAttributedString
    {
        
        let str = NSMutableAttributedString(string: self)
        str.addAttribute(NSAttributedString.Key.strikethroughColor, value: color, range: range)
        str.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: range)
        return str
    }
    
    /// 文字添加链接样式
    func changeCharacterLink(url:NSURL,range:NSRange) -> NSAttributedString
    {
        let str = NSMutableAttributedString(string: self)
        str.addAttribute(NSAttributedString.Key.link, value: url, range: range)
        return str
    }
    
    /// 文字添加倾斜样式<angle:正右倾，负左倾>
    func changeCharacterObliqueness(angle:NSNumber,range:NSRange) -> NSAttributedString
    {
        let str = NSMutableAttributedString(string: self)
        str.addAttribute(NSAttributedString.Key.obliqueness, value: angle, range: range)
        return str
    }
    /// 文字修改字符间距<正值间距加宽，负值间距变窄>
    func changeCharacterKern(value:NSNumber,range:NSRange) -> NSAttributedString
    {
        let str = NSMutableAttributedString(string: self)
        str.addAttribute(NSAttributedString.Key.kern, value: value, range: range)
        return str
    }
    /// 文字横向拉伸<正值横向拉伸文本，负值横向压缩文本 >
    func changeCharacterExpansion(value:NSNumber,range:NSRange) -> NSAttributedString
    {
        let str = NSMutableAttributedString(string: self)
        str.addAttribute(NSAttributedString.Key.expansion, value: value, range: range)
        return str
    }
    /// 设置文字书写方向
    func changeCharacterDirection(direction:NSWritingDirection,range:NSRange) -> NSAttributedString
    {
        let str = NSMutableAttributedString(string: self)
        str.addAttribute(NSAttributedString.Key.writingDirection, value: direction, range: range)
        return str
    }
    /// 设置文字排版方向 <0 表示横排文本，1 表示竖排文本>
    func changeCharacterDirection(value:NSNumber,range:NSRange) -> NSAttributedString
    {
        let str = NSMutableAttributedString(string: self)
        str.addAttribute(NSAttributedString.Key.verticalGlyphForm, value: value, range: range)
        return str
    }
    /// 设置图文混排
    func changeCharacterInsertImage(image:String,range:NSRange) -> NSAttributedString
    {
        let str = NSMutableAttributedString(string: self)
        let attatch = NSTextAttachment()
        attatch.bounds = CGRect(x: 0, y: 0, width: 100, height: 40)
        attatch.image = UIImage(named: image)
        
        let attatchStr = NSAttributedString(attachment: attatch)
        
        str.insert(attatchStr, at: 13)
        return str
    }
    
    /**获取字符串尺寸**/
    
    func getNormalStrSize(str: String? = nil, attriStr: NSMutableAttributedString? = nil, font: CGFloat, w: CGFloat, h: CGFloat) -> CGSize {
        if str != nil {
            let strSize = (str! as NSString).boundingRect(with: CGSize(width: w, height: h), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: font)], context: nil).size
            return strSize
        }
        
        if attriStr != nil {
            let strSize = attriStr!.boundingRect(with: CGSize(width: w, height: h), options: .usesLineFragmentOrigin, context: nil).size
            return strSize
        }
        
        return CGSize.zero
        
    }
    
    /**获取字符串高度H*/
    
    func getNormalStrH(str: String, strFont: CGFloat, w: CGFloat) -> CGFloat {
        return getNormalStrSize(str: str, font: strFont, w: w, h: CGFloat.greatestFiniteMagnitude).height
    }
    
    /**获取字符串宽度W*/
    
    func getNormalStrW(str: String, strFont: CGFloat, h: CGFloat) -> CGFloat {
        return getNormalStrSize(str: str, font: strFont, w: CGFloat.greatestFiniteMagnitude, h: h).width
    }
    
    /**获取富文本字符串高度H*/
    
    func getAttributedStrH(attriStr: NSMutableAttributedString, strFont: CGFloat, w: CGFloat) -> CGFloat {
        return getNormalStrSize(attriStr: attriStr, font: strFont, w: w, h: CGFloat.greatestFiniteMagnitude).height
    }
    
    /**获取富文本字符串宽度W*/
    
    func getAttributedStrW(attriStr: NSMutableAttributedString, strFont: CGFloat, h: CGFloat) -> CGFloat {
        return getNormalStrSize(attriStr: attriStr, font: strFont, w: CGFloat.greatestFiniteMagnitude, h: h).width
    }
}
