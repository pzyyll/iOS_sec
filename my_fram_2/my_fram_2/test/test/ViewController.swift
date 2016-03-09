//
//  ViewController.swift
//  test
//
//  Created by caizhili on 16/3/9.
//  Copyright © 2016年 caizhili. All rights reserved.
//

import UIKit
import my_fram_2

class ViewController: UIViewController, MyPickerViewControllerDelegate {

    var picker = MyPickerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.picker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func clicked(sender: UIButton) {
        self.picker.showInView(self.view)
    }
    
    func myPickViewClose(selected: String) {
        print("selected \(selected)")
    }

}

