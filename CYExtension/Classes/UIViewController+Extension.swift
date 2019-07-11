//
//  UIViewController+Extension.swift
//  CyBasic
//
//  Created by 刘铁崧 on 2019/4/30.
//  Copyright © 2019 com. BDDemo.bd. All rights reserved.
//

import Foundation
import UIKit

/**
 * UIViewController 的扩展类 获取当前的ViewController
 * 使用时只需let nowVC = UIViewController.currentViewController()
 */
public extension UIViewController {
    @objc class func currentViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return currentViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            return currentViewController(base: tab.selectedViewController)
        }
        if let presented = base?.presentedViewController {
            return currentViewController(base: presented)
        }
        return base
    }
}
