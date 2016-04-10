//
//  File.swift
//  LoginVVV
//
//  Created by CAIZHILI on 16/4/6.
//  Copyright © 2016年 CAIZHILI. All rights reserved.
//

import Foundation

extension MBProgressHUD {
    class func showDelayHUDToView(view: UIView, mess: String?) {
        let hud = MBProgressHUD(view: view)
        view.addSubview(hud)
        hud.yOffset = Float(view.frame.size.height) / 4;
        //hud.customView = UIImageView(frame: CGRectZero)
        hud.mode = MBProgressHUDMode.CustomView
        hud.labelText = mess;
        hud.show(true)
        hud.hide(true, afterDelay: 2.0)
    }
}