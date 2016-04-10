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
