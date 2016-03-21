//
//  ViewController.swift
//  Login
//
//  Created by caizhili on 16/3/7.
//  Copyright © 2016年 caizhili. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var pwd: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "regComplete:",
            name: "RegCompleteNotification",
            object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be tyrecreated.
    }

    @IBAction func longin_btn(sender: UIButton) {
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //注册
        if indexPath.section == 2 {
            //
            NSLog("1234")
        }
    }
    
    func regComplete(noti: NSNotification) {
        let data = noti.userInfo! as NSDictionary
        let username = data["username"]! as! String
        self.username.text = username
    }

}

