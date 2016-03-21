//
//  AddEventViewController.swift
//  CoreDataSample
//
//  Created by caizhili on 16/3/21.
//  Copyright © 2016年 caizhili. All rights reserved.
//

import UIKit
import CoreData

class AddEventViewController: UIViewController {

    @IBOutlet weak var eventField: UITextField!

    var appDelegate: AppDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.appDelegate = (UIApplication.sharedApplication().delegate) as! AppDelegate
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let eventName: String? = self.eventField.text
        if eventName != nil && eventName?.characters.count > 0 {
            let newEvent: MyEvent = NSEntityDescription.insertNewObjectForEntityForName("MyEvent", inManagedObjectContext: appDelegate.managedObjContext!) as! MyEvent
            
            newEvent.name = eventName
            newEvent.happenDate = NSDate(timeIntervalSinceNow: 0)
            
            do {
                try self.appDelegate.managedObjContext?.save()
                let actionSheet = UIActionSheet(title: "保存成功", delegate: nil, cancelButtonTitle: "确定", destructiveButtonTitle: nil)
                actionSheet.showInView(self.view)
            } catch let er as NSError {
                print(er.userInfo)
            }
        }
    }
    

}
