//
//  UIImageView+Extension.swift
//  CyBasic
//
//  Created by 刘铁崧 on 2019/5/8.
//  Copyright © 2019 com. BDDemo.bd. All rights reserved.
//

import UIKit

public extension UIImageView {
    /// 添加模糊效果
    func setBlur(type:UIBlurEffect.Style,alpha:CGFloat)->UIImageView {
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: type))
        blurView.frame = self.frame
        blurView.alpha = alpha
        blurView.layer.cornerRadius = self.layer.cornerRadius
        blurView.layer.masksToBounds = true
        self.addSubview(blurView)
        return self
    }
    
    func setImageWithURL(url:String,defaultImage:String)
    {
        self.image = UIImage(named: defaultImage)
        //创建线程<异步>
        DispatchQueue.global().async {
            do{
                let picData = try Data(contentsOf: URL(string: url)!)
                DispatchQueue.main.async {
                    self.image = UIImage(data: picData)
                }
            }
            catch
            {
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.image = UIImage(named: defaultImage)
                }
            }
        }
    }
    
}
