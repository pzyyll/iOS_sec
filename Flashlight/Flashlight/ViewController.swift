//
//  ViewController.swift
//  Flashlight
//
//  Created by caizhili on 16/3/16.
//  Copyright © 2016年 caizhili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lightView: UIView!
    @IBOutlet weak var lightSwitch: UISwitch!
    @IBOutlet weak var lightSlide: UISlider!
    
    
    override func viewDidLoad() {
        let userDefault = NSUserDefaults.standardUserDefaults()
        self.lightSlide.value = userDefault.floatForKey("brightness")
        self.lightSwitch.on = userDefault.boolForKey("onOff")
        userDefault.synchronize()
        
        if self.lightSwitch.on {
            self.lightView.alpha = CGFloat(self.lightSlide.value)
        } else {
            self.lightView.alpha = 0.0
        }
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func setLightAlphaValue(sender: UISlider) {
        let userDefault = NSUserDefaults.standardUserDefaults()
        userDefault.setBool(self.lightSwitch.on, forKey: "onOff")
        userDefault.setFloat(self.lightSlide.value, forKey: "brightness")
        userDefault.synchronize()
        
        if self.lightSwitch.on {
            self.lightView.alpha = CGFloat(self.lightSlide.value)
        } else {
            self.lightView.alpha = 0.0
        }
    }
    

}

