//
//  MainTabBarViewController.swift
//  QQXiangHaSwift
//
//  Created by xuchaoqi on 2017/1/3.
//  Copyright © 2017年 MS. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    ///发布按钮
    fileprivate var publishBtn : ZoomBtn?
    //遮罩
    fileprivate var shade = UIView()
    ///发布View
    fileprivate var publishView : PublishView?
    
    
    override func loadView() {
        super.loadView()
        
        
        /// 初始化TabBar文字颜色
        let item = UITabBarItem.appearance()
        
        var attr:[String:NSObject] = Dictionary ()
        
        attr[NSForegroundColorAttributeName] = UIColor.gray
        
        item.setTitleTextAttributes(attr, for: .normal)
        
        var attr1:[String:NSObject] = Dictionary ()
        
        attr1[NSForegroundColorAttributeName] = UIColor(red: 234.0/255.0, green: 112.0/255.0, blue: 90.0/255.0, alpha: 1)
        
        item.setTitleTextAttributes(attr1, for: .selected)
        
        ///初始化TabBar文字大小
        var attrNor:[String:NSObject] = Dictionary ()
        
        attrNor[NSFontAttributeName ] = UIFont.systemFont(ofSize: 13)
        
        item.setTitleTextAttributes(attr, for: .normal)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    

}

//MARK: - 扩充方法
extension MainTabBarViewController {
    
   fileprivate func setUp() {
        tabBar.backgroundColor = UIColor.white
        
        //添加所有子控制器及底部按钮
        setUpAllChildControllerAndTabItem()
        
        //添加中间发布按钮
        setUpPublishBtn()
    }
    
    /// 添加所有子控制器及底部按钮
    fileprivate func setUpAllChildControllerAndTabItem() {
        //学做菜
        let cookVc  = CookViewController()
        setUponeChildController(controller: cookVc, imageName: "z_home_menu_ico_caipu", selectImageName: "z_home_menu_ico_caipu_active", title: "学做菜")
        
        //商城
        let shopVc = NewsViewController()
        setUponeChildController(controller: shopVc, imageName: "z_home_menu_ico_surprise", selectImageName: "z_home_menu_ico_surprise_active", title: "商城")
        //发布
        let publishVc = MessageViewController()
        setUponeChildController(controller: publishVc, imageName: "", selectImageName: "", title: "")
        //生活圈
        let lifeVc = LifeViewController()
        setUponeChildController(controller: lifeVc, imageName: "z_home_menu_ico_quan", selectImageName: "z_home_menu_ico_quan_active", title: "生活圈")
        //我的
        let meVc = MineViewController()
        setUponeChildController(controller: meVc, imageName: "z_home_menu_ico_me", selectImageName: "z_home_menu_ico_me_active", title: "我的")
        
        meVc.navigationController?.isNavigationBarHidden = true
        
    }
    
    /// 添加中间发布按钮
    fileprivate func setUpPublishBtn() {
        
        let publishBtn = ZoomBtn()
        
        self.publishBtn = publishBtn
        
        publishBtn.img = UIImage (named: "z_home_center_round_btn")
        
        publishBtn.selectedImg = UIImage (named: "z_home_center_btn")
        
        publishBtn.backgroundColor = UIColor.orange
        
        publishBtn.width = 52
        publishBtn.height = self.tabBar.height - 14
        
        
        publishBtn.center = CGPoint(x:self.tabBar.width * 0.5, y:self.tabBar.height * 0.5)
        
        publishBtn.addAction() {
            self.publishBtnOnClick()
        }
        self.tabBar.addSubview(publishBtn)
    }
    
    
}

//MARK: - 自定义方法
extension MainTabBarViewController {
    ///包装一个子控制器
    fileprivate func setUponeChildController(controller : UIViewController ,imageName : String,selectImageName : String,title : String) {
        //判断是否是发布控制器 如果不是则用NavigationViewController进行包装
        guard controller is MessageViewController else{
            
            //不是发布控制器
            
            let nav = MainNavigationViewController(rootViewController:controller)
            
            controller.tabBarItem.title = title
            
            controller.tabBarItem.image = UIImage(named:imageName)?.withRenderingMode(.alwaysOriginal)
            controller.tabBarItem.selectedImage = UIImage(named:selectImageName)?.withRenderingMode(.alwaysOriginal)
            
            self.addChildViewController(nav)
            return
        }
        
        //是发布控制器
        
        controller.tabBarItem.isEnabled = false
        self.addChildViewController(controller)
        
    }
    
    fileprivate func publishBtnOnClick() {
        if publishBtn!.selected {
            //添加遮罩
            addShade()
            //添加发布View
            addPublishView()
        }
        ///改变tabbar子控件透明度 及 遮罩
        for view in tabBar.subviews {
            if view == publishBtn {
                continue
            }else{
                UIView.animate(withDuration: 0.3, animations: {
                    view.alpha = self.publishBtn!.selected ? 0 : 1
                })
            }
            
        }
        
        let publishBtnH = self.publishView!.height + 30
        UIView.animate(withDuration: 0.3, animations: { 
            //设置遮罩层透明度,点击发布设为1，取消发布设为0
            self.shade.alpha = self.publishBtn!.selected ? 1 : 0
            //设置遮罩层颜色透明度,点击发布设为0.7，取消发布设为0
            let alpha  :CGFloat = self.publishBtn!.selected ? 0.7 : 0
            self.shade.backgroundColor = UIColor(white: 0, alpha: alpha)
            
            /**
             弹出 和 关闭 发布按钮
             改变弹出发布按钮所在View 的 y值
             弹出 y : kScreenH + publishView!.kheight  ->
             kScreenH - publishBtnH - 49 - 15   ->
             kScreenH - publishBtnH - 49
             
             关闭 y : HYScreenH - publishBtnH - 49        ->
             kScreenH + publishView!.height
             */
            self.publishView!.y = self.publishBtn!.selected ? (kScreenH - publishBtnH - 49 - 15) : (kScreenH + publishBtnH)
        }) { (true) in
            UIView.animate(withDuration: 0.1, animations: { 
                if self.publishBtn!.selected{
                    self.publishView!.y = kScreenH - publishBtnH - 49
                }
                else {//取消发布则移除遮罩和发布View
                    self.shade.removeFromSuperview()
                }
            })
        }
    }
    
    fileprivate func addShade() {
        shade.frame = CGRect(x:0, y:0, width:kScreenW, height:kScreenH - 49)
        shade.backgroundColor = UIColor(white: 0, alpha: 0)
        shade.alpha = 0
        view.addSubview(shade)
    }
    
    fileprivate func addPublishView() {
        publishView = PublishView.PublishView(invitationBtnOnClickBlock: { 
            print("发帖")
        }, menuBtnOnClickBlock: { 
            print("写菜谱")
        })
        
        shade.addSubview(publishView!)
        //超出父控件的部分隐藏
        shade.clipsToBounds = true
        publishView!.frame = CGRect(x:0, y:kScreenH + publishView!.height, width:kScreenW, height:publishView!.height)
    }
}
