//
//  ViewController.swift
//  test
//
//  Created by caizhili on 16/2/29.
//  Copyright © 2016年 caizhili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //var label: UILabel!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showYes(sender: UIButton) {
        self.label!.text = "yes"
    }
 
    @IBAction func itemBtnMid(sender: UIBarButtonItem) {
        self.label!.text = "MidItem"
    }
}

