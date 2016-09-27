//
//  FourthVC.swift
//  CustomNavigationBarDemo
//
//  Created by 也许、 on 16/9/27.
//  Copyright © 2016年 K. All rights reserved.
//

import UIKit

class FourthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "我"
        self.view.backgroundColor = UIColor.white
        
        // 设置返回按钮的其中一种方式
//        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
//        self.navigationController?.navigationBar.tintColor = UIColor.black
        
        // 设置右侧按钮
        let settingItem = UIBarButtonItem.initBarButtonItem(image: "navigationbar_friendattention", target: self, action: #selector(self.setting))
        self.navigationItem.rightBarButtonItem = settingItem
        
    }
    
    // 设置
    func setting() {

        let settingVC = SettingVC()
        settingVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(settingVC, animated: true)
        
    }

}
