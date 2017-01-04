//
//  PublishView.swift
//  QQXiangHaSwift
//
//  Created by xuchaoqi on 2017/1/3.
//  Copyright © 2017年 MS. All rights reserved.
//

import UIKit

class PublishView: UIView {

    @IBOutlet weak var invitationBtn: TopImageBtn!
    
    @IBOutlet weak var menuBtn: TopImageBtn!

    ///发帖点击事件闭包
    static var invitationBtnOnClickBlock : (() -> ())?
    ///写菜谱点击事件闭包
    static var menuBtnOnClickBlock :  (() -> ())?
    
    class func PublishView(invitationBtnOnClickBlock : @escaping (() -> ()),menuBtnOnClickBlock :  @escaping (() -> ()))  -> PublishView!{
        
        let publishView = Bundle.main.loadNibNamed("PublishView", owner: nil , options: nil)?.first as! PublishView
        self.invitationBtnOnClickBlock = invitationBtnOnClickBlock
        self.menuBtnOnClickBlock = menuBtnOnClickBlock
        
        return publishView
    }
    
    @IBAction func invitationBtnOnClick(_ sender: TopImageBtn) {
        PublishView.invitationBtnOnClickBlock!()
    }
    
    @IBAction func menuBtnOnClick(_ sender: TopImageBtn) {
        PublishView.menuBtnOnClickBlock!()
    }
    
    
}
