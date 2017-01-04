//
//  TopImageBtn.swift
//  QQXiangHaSwift
//
//  Created by xuchaoqi on 2017/1/3.
//  Copyright © 2017年 MS. All rights reserved.
//

import UIKit

class TopImageBtn: UIButton {

    var margin : CGFloat = 10
    /**
     图片在上面的Button
     */
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView?.centerX = self.width * 0.5
        imageView?.centerY = self.height * 0.5 * 0.8
        
        titleLabel?.sizeToFit()
        
        titleLabel?.centerX = self.width * 0.5
        titleLabel?.y = (imageView?.frame)!.maxY + margin
        
    }

}
