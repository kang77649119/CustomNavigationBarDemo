//
//  KNavigationController.swift
//  CustomNavigationBarDemo
//
//  Created by 也许、 on 16/9/27.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class KNavigationController: UINavigationController,UIGestureRecognizerDelegate {
    
    override func loadView() {
        super.loadView()
        
        // 设置导航样式
        let navBar = UINavigationBar.appearance(whenContainedInInstancesOf: [KNavigationController.classForCoder() as! UIAppearanceContainer.Type])
        
        navBar.barTintColor = UIColor.orange
        navBar.tintColor = UIColor.white
        let dict = [ NSForegroundColorAttributeName : UIColor.white ]
        navBar.titleTextAttributes = dict
        
        // 打印导航栏的交互手势(手势为UIScreenEdgePanGestureRecognizer  屏幕边缘手势)
        // print(self.interactivePopGestureRecognizer?.delegate)
        // Optional(<UIScreenEdgePanGestureRecognizer: 0x7fbc68410700; state = Possible; delaysTouchesBegan = YES; view = <UILayoutContainerView 0x7fbc6b00fbe0>; target= <(action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition 0x7fbc684105c0>)>>)
        
        // 设置全局手势(恢复边缘返回手势的话,需要注释掉下面的代码)
        let pan = UIPanGestureRecognizer(target: self.interactivePopGestureRecognizer?.delegate, action: Selector(("handleNavigationTransition:")))
        pan.delegate = self
        
        self.view.addGestureRecognizer(pan)
        
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        super.pushViewController(viewController, animated: animated)
        
        // 判断 导航栏子控制器大于2个才具有返回按钮
        if self.childViewControllers.count > 1 {
            
            // 设置返回按钮
            viewController.navigationItem.leftBarButtonItem = returnItem
            
            // 取消委托(可以恢复返回上一个界面的手势,只能是边缘返回手势!!!)
            self.interactivePopGestureRecognizer?.delegate = nil
            
        }
  
    }
    
    // 返回按钮
    lazy var returnItem:UIBarButtonItem = UIBarButtonItem.initReturnItem(image: "navigationButtonReturn", target: self, action: #selector(self.pop))
    
    // 返回
    func pop() {
        
        self.popViewController(animated: true)
        
    }
    
    // 手势处理
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        // 根据子控制个数来判断什么时候执行返回手势
        print(self.childViewControllers.count)
        return self.childViewControllers.count > 1
        
    }
    
    
    

}
