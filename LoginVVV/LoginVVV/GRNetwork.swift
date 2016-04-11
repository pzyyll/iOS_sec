//
//  GRNetwork.swift
//  LoginVVV
//
//  Created by caizhili on 16/4/11.
//  Copyright © 2016年 CAIZHILI. All rights reserved.
//

import UIKit
import Alamofire

class GRNetwork: NSObject {

    let lognUrl = "http://www.neuedu.cn/m/mobileLogin!loginNeu.action"
    
    var data: NSData? = NSData()
    //单例模式
    class var shareInstance: GRNetwork {
        //保持对外不可见，周期全局
        struct StaticInstance {
            static var instance: GRNetwork!
            static var token: dispatch_once_t = 0;
        }
        
        dispatch_once(&StaticInstance.token) {
            StaticInstance.instance = GRNetwork()
        }
        
        return StaticInstance.instance
    }
    
    typealias NetworkBlock = (flag: Bool) -> Void
    func GRNetwork_Logn(parameters: [String: AnyObject]?, view: UIView?, block: NetworkBlock?) {
        MBProgressHUD.showHUDAddedTo(view, animated: true)
        Alamofire.request(.POST, lognUrl, parameters: parameters, encoding: .URL, headers: nil).response(queue: dispatch_get_main_queue()) { (req, respon, data, err) in
            if err == nil {
                MBProgressHUD.hideHUDForView(view, animated: true)
                if block != nil {
                    dispatch_async(dispatch_get_main_queue()) {
                        self.reload(data!)
                    }
                    let datajson = try? NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                    print(datajson as? NSDictionary);
                    let logReturnModel = ROLogonReturnModel.logonReturnModelWithDict(datajson as? NSDictionary)
                    if logReturnModel != nil {
                        if logReturnModel!.loginFlag == "1" {
                            block!(flag: true)
                        } else {
                            MBProgressHUD.showDelayHUDToView(view!, mess: logReturnModel!.msg!);
                            block!(flag: false);
                        }
                    } else {
                        block!(flag: false);
                    }
                } else {
                    block!(flag: false);
                }
            } else {
                MBProgressHUD.hideHUDForView(view, animated: true)
                if block != nil {
                    block!(flag: false)
                }
            }
        }
    }
    
    func reload(data: NSData) {
        self.data = data;
    }
    
    func show () {
        print(self.data!)
    }
    
}
