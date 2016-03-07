//
//  RegViewController.swift
//  Login
//
//  Created by caizhili on 16/3/7.
//  Copyright © 2016年 caizhili. All rights reserved.
//

import UIKit



class RegViewController: UIViewController {

    @IBOutlet weak var regTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            let data = ["username": self.regTextField.text!]
            NSNotificationCenter.defaultCenter().postNotificationName(
        "RegCompleteNotification", object: nil, userInfo: data)
        }
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
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
