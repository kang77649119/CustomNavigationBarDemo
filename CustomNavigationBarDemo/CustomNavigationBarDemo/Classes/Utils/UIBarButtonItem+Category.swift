//
//  UITabBarItem+Category.swift
//  CustomNavigationBarDemo
//
//  Created by 也许、 on 16/9/27.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

extension UIBarButtonItem {

    // 自定义导航栏右侧按钮
    static func initBarButtonItem(image:String,target: Any?, action: Selector) -> UIBarButtonItem {
        
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: image), for: .normal)
        btn.setImage(UIImage(named: image + "_highlighted"), for: .highlighted)
        btn.addTarget(target, action: action, for: .touchUpInside)
        btn.sizeToFit()
        return UIBarButtonItem(customView: btn)
        
    }
    
    // 自定义导航栏返回按钮
    static func initReturnItem(image:String,target: Any?, action: Selector) -> UIBarButtonItem {
        
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: image), for: .normal)
        btn.setImage(UIImage(named: image + "Click"), for: .highlighted)
        btn.addTarget(target, action: action, for: .touchUpInside)
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0)
        btn.sizeToFit()
        return UIBarButtonItem(customView: btn)
        
    }
    
    
    

}
