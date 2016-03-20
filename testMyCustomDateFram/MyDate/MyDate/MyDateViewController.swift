//
//  MyDateViewController.swift
//  MyDate
//
//  Created by CAIZHILI on 16/3/20.
//  Copyright © 2016年 CAIZHILI. All rights reserved.
//

import UIKit

public protocol MyDateControllerDelegate{
    func myPickDateView(ctr: MyDateViewController, selectedDate date: NSDate)
}

public class MyDateViewController: UIViewController {

    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    public var delegate: MyDateControllerDelegate!
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public init() {
        
        let recourcesBundle = NSBundle(forClass: MyDateViewController.self)
        
        super.init(nibName: "MyDateViewController", bundle: recourcesBundle)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelAct(sender: AnyObject) {
        self.hideInView()
        
    }

    @IBAction func doneAct(sender: AnyObject) {
        self.hideInView()
        self.delegate.myPickDateView(self, selectedDate: self.myDatePicker.date)
    }
    
    public func showInView(superview: UIView) {
        if self.view.superview == nil {
            superview.addSubview(self.view)
        }
        self.view.center = CGPointMake(self.view.center.x, 900)
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, superview.frame.width, self.view.frame.height)
        
        UIView.animateWithDuration(0.5, delay: 0.2, options: .CurveEaseInOut, animations: { () -> Void in
            
            self.view.center = CGPointMake(superview.center.x, superview.frame.height - self.view.frame.height / 2)
            
            }, completion: nil)
    }
    
    public func hideInView() {
        UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseInOut, animations: { () -> Void in
            self.view.center = CGPointMake(self.view.center.x, 900)
            }, completion: nil)
    }
    
    /*
    @IBOutlet weak var done: UIBarButtonItem!
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
