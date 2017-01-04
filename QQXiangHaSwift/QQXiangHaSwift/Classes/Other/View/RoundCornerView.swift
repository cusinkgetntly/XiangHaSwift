//
//  RoundCornerView.swift
//  QQXiangHaSwift
//
//  Created by xuchaoqi on 2017/1/3.
//  Copyright © 2017年 MS. All rights reserved.
//

import UIKit

class RoundCornerView: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = 3
        clipsToBounds = true
    }

}
