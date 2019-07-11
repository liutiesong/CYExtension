//
//  UIImage+Extension.swift
//  CyBasic
//
//  Created by 刘铁崧 on 2019/4/30.
//  Copyright © 2019 com. BDDemo.bd. All rights reserved.
//
// IOS 图片滤镜文档：https://developer.apple.com/library/archive/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/uid/TP30000136-SW29
//

import Foundation
import UIKit
import CoreImage


@available(iOS 8.2, *)
public extension UIImage
{
    /// 根据颜色制作图片
    @objc class func imageFromColor(color: UIColor,size:CGSize) -> UIImage?
    {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    /// 制作文字制作图片
    @objc class func createFontImage(text:NSString,textColor: UIColor,backgroundColor:UIColor,size:CGSize,radius:CGFloat) -> UIImage?
    {
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: Int(size.width), height: Int(size.height)))

        label.text = text as String
        label.textAlignment = NSTextAlignment.center
        label.textColor = textColor
        label.backgroundColor = backgroundColor

        label.minimumScaleFactor = 1
        label.font = UIFont.systemFont(ofSize:size.width/2, weight: UIFont.Weight.bold)
        
        label.layer.cornerRadius = radius
        label.layer.masksToBounds = true


        UIGraphicsBeginImageContextWithOptions(label.bounds.size, false, 4.0)

        label.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()


        return image
        
    }
    
    class func image(_ text:String,size:(CGFloat,CGFloat),backColor:UIColor=UIColor.orange,textColor:UIColor=UIColor.white,isCircle:Bool=true) -> UIImage?{
        // 过滤空""
        if text.isEmpty { return nil }
        // 取第一个字符(测试了,太长了的话,效果并不好)
        let letter = (text as NSString).substring(to: 1)
        let sise = CGSize(width: size.0, height: size.1)
        let rect = CGRect(origin: CGPoint.zero, size: sise)
        // 开启上下文
        UIGraphicsBeginImageContext(sise)
        // 拿到上下文
        guard let ctx = UIGraphicsGetCurrentContext() else { return nil }
        // 取较小的边
        let minSide = min(size.0, size.1)
        // 是否圆角裁剪
        if isCircle {
            UIBezierPath(roundedRect: rect, cornerRadius: minSide*0.5).addClip()
        }
        // 设置填充颜色
        ctx.setFillColor(backColor.cgColor)
        // 填充绘制
        ctx.fill(rect)
        let attr = [ NSAttributedString.Key.foregroundColor : textColor, NSAttributedString.Key.font : UIFont.systemFont(ofSize: minSide*0.5)]
        // 写入文字
        (letter as NSString).draw(at: CGPoint(x: minSide*0.25, y: minSide*0.25), withAttributes: attr)
        // 得到图片
        let image = UIGraphicsGetImageFromCurrentImageContext()
        // 关闭上下文
        UIGraphicsEndImageContext()
        return image
    }



    
    /// 重设图片大小
    func reSizeImage(reSize:CGSize)->UIImage {
        //UIGraphicsBeginImageContext(reSize);
        UIGraphicsBeginImageContextWithOptions(reSize,false,UIScreen.main.scale);
        self.draw(in: CGRect(x: 0, y: 0, width: reSize.width, height: reSize.height))
        let reSizeImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!;
        UIGraphicsEndImageContext();
        return reSizeImage;
    }
    
    /// 改变图片颜色
    func changeImageColor(color:UIColor)->UIImage
    {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        color.setFill()
        UIRectFill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height), blendMode: CGBlendMode.destinationIn, alpha: 1.0)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    /// 添加水印
    func addWaterMark(waterMarkImage:UIImage,opacity:CGFloat,margin:CGFloat)->UIImage
    {
        let posX = self.size.width-waterMarkImage.size.width-margin
        let posY = self.size.height-waterMarkImage.size.height-margin
        UIGraphicsBeginImageContext(self.size)
        self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        waterMarkImage.draw(in: CGRect(x: posX, y: posY, width: waterMarkImage.size.width, height: waterMarkImage.size.height), blendMode: CGBlendMode.normal, alpha: opacity)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
//    func creatFontImage(font:NSString,fontColor:UIColor,backgroundColor:UIColor,size:CGSize,radius:CGFloat) -> UIImage?
//    {
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
//        label.font = font
//        label.text = text
//        label.textColor = color
//        label.textAlignment = .center
//        label.backgroundColor = backgroundColor
//        
//        let image = UIImage(fromView: label)
//        UIGraphicsBeginImageContextWithOptions(size, false, 0)
//        image?.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
//        
//        self.init(cgImage:(UIGraphicsGetImageFromCurrentImageContext()?.cgImage!)!)
//        UIGraphicsEndImageContext()
//    }
    
    /// 等比率缩放
    func scaleImage(scaleSize:CGFloat)->UIImage {
        let reSize = CGSize(width: self.size.width * scaleSize, height: self.size.height * scaleSize)
        return reSizeImage(reSize: reSize)
    }
    
    /// 转化为灰度图片
    func grayColorImage()->UIImage {
        let imageSize = self.size
        let width = Int(imageSize.width)
        let height = Int(imageSize.height)
        
        let spaceRef = CGColorSpaceCreateDeviceGray()
        let context = CGContext(data: nil, width: width, height: height, bitsPerComponent: 8, bytesPerRow: 0, space: spaceRef, bitmapInfo: CGBitmapInfo().rawValue)!
        
        let rect = CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height)
        context.draw(self.cgImage!, in: rect)
        let grayImage = UIImage(cgImage: context.makeImage()!)
        return grayImage
        
    }
    
    /// 转化为单色图片
    func singleColorImage(color:UIColor)->UIImage {
        
        let filter = CIFilter(name: "CIColorMonochrome")
        filter?.setValue(CIColor(color: color), forKey: kCIInputColorKey)
        filter?.setValue(1.0, forKey: kCIInputIntensityKey)
        filter?.setValue(CIImage(image: self), forKey: kCIInputImageKey)
        
        
        return UIImage(ciImage: (filter?.outputImage)!)
        
    }
    
    /// 修改色相
    func changeHue(value:CGFloat)->UIImage {
        
        let filter = CIFilter(name: "CIHueAdjust")
        filter?.setValue(value, forKey: kCIInputAngleKey)
        filter?.setValue(CIImage(image: self), forKey: kCIInputImageKey)
        
        
        return UIImage(ciImage: (filter?.outputImage)!)
        
    }
    
    /// 老照片
    func oldPhoto()->UIImage
    {
        let filter = CIFilter(name: "CIPhotoEffectTransfer")
        
        
        //        filter?.setValue(value, forKey: kCIInputAngleKey)
        filter?.setValue(CIImage(image: self), forKey: kCIInputImageKey)
        
        return UIImage(ciImage: (filter?.outputImage)!)
    }
    
    /// 褪色
    func fade()->UIImage
    {
        let filter = CIFilter(name: "CIPhotoEffectFade")
        
        
        //        filter?.setValue(value, forKey: kCIInputAngleKey)
        filter?.setValue(CIImage(image: self), forKey: kCIInputImageKey)
        
        return UIImage(ciImage: (filter?.outputImage)!)
    }
    
    /// 忧郁效果
    func gloom(value:NSNumber)->UIImage
    {
        let filter = CIFilter(name: "CIGloom")
        
        filter?.setValue(CIImage(image: self), forKey: kCIInputImageKey)
        //        filter?.setValue(value, forKey: kCIInputAngleKe
        filter?.setValue(value, forKey: kCIInputIntensityKey)
        
        return UIImage(ciImage: (filter?.outputImage)!)
    }
    
    /// 调整高光阴影
    func highLightShadowAdjust(light:NSNumber,shadow:NSNumber)->UIImage
    {
        let filter = CIFilter(name: "CIHighlightShadowAdjust")
        
        filter?.setValue(CIImage(image: self), forKey: kCIInputImageKey)
        filter?.setValue(light, forKey: "inputHighlightAmount")
        filter?.setValue(shadow, forKey: "inputShadowAmount")

        
        return UIImage(ciImage: (filter?.outputImage)!)
    }
    
    
    ///图片加码
    func addMosaic(value:CGFloat)->UIImage {
        
        let filter = CIFilter(name: "CIPixellate")
        filter?.setDefaults()
        filter?.setValue(value, forKey: kCIInputScaleKey)
        filter?.setValue(CIImage(image: self), forKey: kCIInputImageKey)
        
        
        return UIImage(ciImage: (filter?.outputImage)!)
        
    }
    
    ///图片自动优化
    func imageAutomaticallyOptimizing()->UIImage
    {
        var image = CIImage(image: self)
        let filters = image!.autoAdjustmentFilters() as [CIFilter]
        for filter:CIFilter in filters
        {
            filter.setValue(image, forKey:kCIInputImageKey)
            image = filter.outputImage
        }
        return UIImage(ciImage: image!)
    }
    
    
}
