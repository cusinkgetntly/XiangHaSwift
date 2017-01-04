//
//  MainNavigationViewController.swift
//  QQXiangHaSwift
//
//  Created by xuchaoqi on 2017/1/3.
//  Copyright © 2017年 MS. All rights reserved.
//

import UIKit

class MainNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }

}

//MARK: - 重载
extension MainNavigationViewController {
    
//    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
//        
//    }
}

//MARK: - 方法
extension MainNavigationViewController {
    
    /// 初始化
    func setup() {
        //设置title字体大小
        let navBar = UINavigationBar.appearance()
        var attrNor:[String:NSObject] = Dictionary ()
        attrNor[NSFontAttributeName ] = UIFont.boldSystemFont(ofSize: 14)
        navBar.titleTextAttributes = attrNor
        
        //设置title字体颜色
        
        var attr:[String:NSObject] = Dictionary ()
        attr[NSForegroundColorAttributeName] = UIColor.white
        navBar.titleTextAttributes = attr
        
        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        //设置导航栏背景颜色
        navBar.barTintColor = UIColor.orange
    }
}
