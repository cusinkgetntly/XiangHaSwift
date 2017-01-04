//
//  HttpTools.swift
//  QQXiangHaSwift
//
//  Created by xuchaoqi on 2016/12/30.
//  Copyright © 2016年 MS. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType{
    case get
    case post
}

class HttpTools {
    class func requestData (_ type : MethodType,URLString : String,paramters : [String : Any]? = nil,finishedCallback:@escaping (_ result : Any) -> ()){
    
        let method : HTTPMethod = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        Alamofire.request(URLString, method: method, parameters: paramters).responseJSON { (response) in
            guard let result = response.result.value else {
                print(response.result.error ?? "网络请求失败")
                return
            }
            finishedCallback(result)
        }
    }
}
