//
//  ViewController.swift
//  sqlDict
//
//  Created by caizhili on 16/3/21.
//  Copyright © 2016年 caizhili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var wordField: UITextField!
    @IBOutlet weak var detailField: UITextField!
    @IBOutlet weak var queryField: UITextField!
    @IBOutlet weak var displayView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func finishEdit(sender: UITextField) {
    }

    @IBAction func addWord(sender: AnyObject) {
        
    }
    
    @IBAction func queryAction(sender: AnyObject) {
        
    }
}

