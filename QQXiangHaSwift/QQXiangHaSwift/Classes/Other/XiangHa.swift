//
//  XiangHa.swift
//  QQXiangHaSwift
//
//  Created by xuchaoqi on 2017/1/3.
//  Copyright © 2017年 MS. All rights reserved.
//

import Foundation
import UIKit

let kScreenH = UIScreen.main.bounds.height

let kScreenW = UIScreen.main.bounds.width

let kScreenBounds = UIScreen.main.bounds

let iPhone6P = (kScreenH == 736)

let iPhone6 = (kScreenH == 667)

///是iPhone5
let  iPhone5 = (kScreenH == 568)

/// 广告请求
let ADUrl : String = "http://mobads.baidu.com/cpro/ui/mads.php"

///广告请求参数
let adCode2 : String = "phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3Ln-tkQW08nau_I1Y1P1Rhmhwz5Hb8nz3zFMTqP1RsFMKo5yPEUi43py78uv99QMKzUzu9TZfqrau9mvnqf-w5Fhq15y-ETzubuy3qnBuzug7xpyfqmHf4nAP9PhwWmW9WP17-mhfYuH7bPj7buWR1mWmYnhchUy7s5HDhIywGujd9mW7bmymkPWmzuhczuHFWnHwhPAN9PyD4PhfsrjT4PWFbmhc4nAPbFMPLpHYkFh7sTA-b5ymLPAczmyuhFhPdTWYsFMKzuykEmyfqnauGuAu95RRYnW-DPjndQH04wH6VPDw7PaY3PHKAQH6kfbP7PW0vPjfswBu9mLfqHbD_H70_wDshTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhu-IjdcNDdnQD7rNDb_HNPHRau_pjYdPWThmgKGujYzPjcYPWcdFh7s5H0hIhfqniusThqb5gF1TAk9Tv6hTv3qwHfzrRfYn1RVnj-7raYYwDRYQH6dnDmVrj7afYRvnjmYPjKAFh7sTZu-TWYkFhPV5HRknBuYUHYdnHchULK9mv-YXHYkFMwzuMws5gPbpdt1QWTzFh7Y5HchpjYknHnYFMws5y-fpAq8uH6_niuYmycqnau1IjYkPjmvn1cvnH0YPHTYQW6kPauVmybqnauBnHfvPWnzPWDsPjYkFMP-UWdDiNn_fb7nQ7PPRzkPfN0_Nbf_RY95Q7PFHBkHHdR_fRPjQDdFfzkZR7n_fYqPQD7iQ7uDHikPNDt_wD-iFMP9UjYhmLnqPAf1rymvrAcLnvF9njubuhDLn1RYPj7WmW--nWmvrj0hTvwW5HTLra3srHnLPH0_nHD4rHc8rj0sP16kFh3qniu1Ugnqniu1I1YLPH0hUhqs5Hfvnj0zFhd-UHYLP168njb1P1RsQjDkrHbzQW6snjT3niuk5ymLPAczmyuhgvPsTBu_my4bTvP9TARqnamb"
