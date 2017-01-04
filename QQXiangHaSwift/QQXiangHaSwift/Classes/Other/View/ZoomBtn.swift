//
//  ZoomBtn.swift
//  QQXiangHaSwift
//
//  Created by xuchaoqi on 2017/1/3.
//  Copyright © 2017年 MS. All rights reserved.
//

import UIKit

class ZoomBtn: RoundCornerView {

    //选择状态
    var selected : Bool = false
    //图片
    private var imgView : UIImageView = UIImageView()
    
    ///默认图片
    var img : UIImage?{
        
        didSet{
            imgView.image = img
        }
        
    }
    ///选中图片
    var selectedImg : UIImage?
    
    ///点击事件的闭包
    private  var  block : (()->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
        self.imgView.isUserInteractionEnabled = true
        addSubview(imgView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //设置尺寸
    override func layoutSubviews() {
        super.layoutSubviews()
        imgView.sizeToFit()
        imgView.center = CGPoint(x:self.width * 0.5, y:self.height * 0.5)
        
    }
    
    //添加点击监听
    func addAction( block:@escaping ()->()) {
        self.block = block
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        
        self.addGestureRecognizer(tap)
        
    }
    
    @objc private  func tapAction()  {
        
        //动画执行时间
        let duration = 0.15
        
        // 设定为缩放
        let animation  = CABasicAnimation (keyPath: "transform.scale")
        
        // 动画选项设定
        animation.duration = duration; // 动画持续时间
        
        // 缩放倍数
        animation.fromValue = 1.0 // 开始时的倍率
        animation.toValue = 0.0 // 结束时的倍率
        animation.autoreverses = true // 动画结束时执行逆动画
        
        // 添加动画
        self.imgView.layer.add(animation, forKey: "scale-layer")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
            self.imgView.image = self.selected ? self.selectedImg : self.img
        }
        
        selected = !selected
        
        self.block!()
        
    }

}
