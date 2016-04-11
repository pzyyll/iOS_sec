//
//  ROLogonReturnModel.swift
//  LoginVVV
//
//  Created by caizhili on 16/4/11.
//  Copyright © 2016年 CAIZHILI. All rights reserved.
//

import UIKit

class ROLogonReturnModel: NSObject {
    var loginFlag: String!
    var msg: String?
    
    class func logonReturnModelWithDict(dict: NSDictionary?) -> ROLogonReturnModel? {
        if (dict == nil) {
            return nil
        }
        let model = ROLogonReturnModel()
        let loginReturnDict = dict!["loginReturn"] as! NSDictionary
        let loginFlag = loginReturnDict["loginFlag"] as! String
        model.loginFlag = loginFlag
        let msg = loginReturnDict["msg"] as? String
        model.msg = msg
        
        print(model.msg)
        
        return model
    }
}
