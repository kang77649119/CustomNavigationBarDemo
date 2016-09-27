//
//  MainController.swift
//  CustomNavigationBarDemo
//
//  Created by 也许、 on 16/9/27.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class MainController: UITabBarController {
    
    override func loadView() {
        super.loadView()
        
        let tabBar = UITabBar.appearance(whenContainedInInstancesOf: [MainController.classForCoder() as! UIAppearanceContainer.Type])
        tabBar.tintColor = UIColor.orange
        let dict = [ NSFontAttributeName : UIFont.systemFont(ofSize: 13) ]
        UITabBarItem.appearance().setTitleTextAttributes(dict, for: .normal)
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // 初始化UI
        setupUI()
        
    }

    // 初始化UI
    func setupUI() {
    
        initTabBar(childController: FirstVC(), title: "首页", image: "tabbar_home")
        initTabBar(childController: SecondVC(), title: "发现", image: "tabbar_discover")
        initTabBar(childController: ThirdVC(), title: "消息", image: "tabbar_message_center")
        initTabBar(childController: FourthVC(), title: "我", image: "tabbar_profile")
        
    }
    
    // 初始化tabBar
    func initTabBar(childController:UIViewController,title:String, image:String) {
    
        let nav = KNavigationController(rootViewController: childController)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
        nav.tabBarItem.selectedImage = UIImage(named: image + "_highlighted")?.withRenderingMode(.alwaysOriginal)
        self.addChildViewController(nav)
    
    }


}
