//
//  ViewController.swift
//  testMyCustomDateFram
//
//  Created by CAIZHILI on 16/3/20.
//  Copyright © 2016年 CAIZHILI. All rights reserved.
//

import UIKit
import MyDate


class ViewController: UIViewController, MyDateControllerDelegate {
    @IBOutlet weak var displayLabel: UILabel!
    var myDateP: MyDateViewController!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myDateP = MyDateViewController()
        
        self.myDateP.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func popDateP(sender: AnyObject) {
        myDateP.showInView(self.view)
    }
    
    func myPickDateView(ctr: MyDate.MyDateViewController, selectedDate date: NSDate) {
        let dateForm = NSDateFormatter()
        dateForm.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateStr = dateForm.stringFromDate(date)
        self.displayLabel.text = dateStr
    }

   
}

