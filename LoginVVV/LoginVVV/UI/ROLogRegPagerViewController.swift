//
//  ROLogRegPagerViewController.swift
//  LoginVVV
//
//  Created by CAIZHILI on 16/4/6.
//  Copyright © 2016年 CAIZHILI. All rights reserved.
//

import UIKit
import Alamofire

class ROLogRegPagerViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var pwd: UITextField!
    @IBOutlet weak var checkCode: UITextField!
    @IBOutlet weak var checkImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let clickeCheckImgGes = UITapGestureRecognizer(target: self, action: #selector(self.clickeCheckImg(_:)));
        self.checkImg.addGestureRecognizer(clickeCheckImgGes);
        
        self.clickeCheckImg(clickeCheckImgGes)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancleBtnAction(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }

    func clickeCheckImg(sender: UITapGestureRecognizer) {
        let url = NSURL(string: "http://www.neuedu.cn/imgcode")
        let data = NSData(contentsOfURL: url!)
        self.checkImg.image = UIImage(data: data!)
    }
    @IBAction func loginAction(sender: AnyObject) {
        MBProgressHUD.showDelayHUDToView(self.view, mess: "abc")
        let parameters = [
        "username": self.username.text!,
        "pwd": self.pwd.text!,
        "imgcode": self.checkCode.text!
        ]
        //var samp = dispatch_semaphore_create(0)
        GRNetwork.shareInstance.GRNetwork_Logn(parameters, view: self.view) { (flag) in
            if flag {
                ACSimpleKeychain.defaultKeychain().storeUsername(self.username.text!, password: self.pwd.text!, identifier: "user1", forService: "userpassword")
                
                let tabBarCtr = UITabBarController()
                
                //one
                let oneCtr = UIViewController()
                oneCtr.view.backgroundColor = UIColor.blueColor()
                let oneNavCtr = UINavigationController(rootViewController: oneCtr)
                
                let twoCtr = UIViewController()
                twoCtr.view.backgroundColor = UIColor.redColor()
                let twoNavCtr = UINavigationController(rootViewController: twoCtr)
                
                tabBarCtr.viewControllers = [oneNavCtr, twoNavCtr];
                //tabBarCtr.tabBar.frame
                let imgStr = ["bar_first", "bar_second"];
                let titleStr = ["One", "Two"];
                
                var i = 0;
                for item in tabBarCtr.tabBar.items! {
                    item.image = UIImage(named: imgStr[i])
                    item.title = titleStr[i]
                    i += 1;
                }
                UIApplication.sharedApplication().delegate?.window!?.rootViewController = tabBarCtr
                
            }
            //dispatch_semaphore_signal(samp)
        }
        //dispatch_semaphore_wait(samp, DISPATCH_TIME_FOREVER);
        GRNetwork.shareInstance.show()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
