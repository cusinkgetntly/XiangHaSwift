//
//  ADViewController.swift
//  QQXiangHaSwift
//
//  Created by xuchaoqi on 2016/12/30.
//  Copyright © 2016年 MS. All rights reserved.
//

import UIKit
import Kingfisher

class ADViewController: UIViewController {

    @IBOutlet weak var lanunchImageView: UIImageView!
    
    @IBOutlet weak var jumpBtn: UIButton!
    
    @IBOutlet weak var containView: UIView!
    fileprivate weak var timer : Timer?
    fileprivate var adModel : ADModel?
    
    static var i = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLanchImage()
        loadADData()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeChage), userInfo: nil, repeats: true)
    }

    @IBAction func jumpOnClick(_ sender: UIButton) {
        
        let tabVc = MainTabBarViewController()
        
        UIApplication.shared.keyWindow?.rootViewController = tabVc
        
        timer?.invalidate()
        
    }
}

extension ADViewController {
    fileprivate func setupLanchImage() {
        var launchImage : UIImage? = nil
        
        if iPhone6P {
            launchImage = UIImage (named:"LaunchImage-800-Portrait-736h@3x")
        }else if iPhone6{
            launchImage = UIImage (named: "LaunchImage-800-667h@2x")
        }else if iPhone5{
            launchImage = UIImage (named: "LaunchImage-700-568h@2x")
        }
        
        lanunchImageView.image = launchImage
    }
    
    fileprivate func loadADData() {
        
        let imageView = UIImageView()
        containView.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH * 0.8)
        let imageURL = URL(string : "http://e.hiphotos.baidu.com/zhidao/pic/item/63d0f703918fa0ecc4380cbd209759ee3c6ddb87.jpg")
        imageView.kf.setImage(with: imageURL)
        imageView.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer( target: self, action: #selector(tapOnClick))
        imageView.addGestureRecognizer(tapGesture)
        
    }
    
    @objc fileprivate func timeChage() {
        ADViewController.i -= 1
        
        let title = String("跳过\(ADViewController.i)")
        
        jumpBtn.setTitle(title, for: .normal)
        
        if ADViewController.i == -1 {
            jumpOnClick(jumpBtn)
        }
    }
    
    @objc fileprivate func tapOnClick() {
        let url = NSURL (string : "www.baidu.com")
        
        if UIApplication.shared.canOpenURL(url as! URL) {
            UIApplication.shared.canOpenURL(url as! URL)
        }
    }
    
}
