//
//  MyPickerViewController.swift
//  my_fram_2
//
//  Created by caizhili on 16/3/9.
//  Copyright © 2016年 caizhili. All rights reserved.
//

import UIKit

public protocol MyPickerViewControllerDelegate {
    func myPickViewClose(selected: String)
}

public class MyPickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var pickerView: UIPickerView!
    
    
    public var delegate: MyPickerViewControllerDelegate?
    
    var pickerData: NSArray!
    
    public init() {
        let resourcesBundle = NSBundle(forClass: MyPickerViewController.self)
        super.init(nibName: "MyPickerViewController", bundle: resourcesBundle)
        self.pickerData = ["价格不限", "$0-->$1000 day", "$1000-->$2000 day"]
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancle(sender: UIBarButtonItem) {
        self.hideInView()
    }

    @IBAction func done(sender: UIBarButtonItem) {
        self.hideInView()
        
        let selectedIndex = self.pickerView.selectedRowInComponent(0)
        
        self.delegate?.myPickViewClose(self.pickerData[selectedIndex] as! String)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // returns the number of 'columns' to display.
    public func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // returns the # of rows in each component..
    public func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerData.count
    }
    
    public func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pickerData[row] as? String
    }
    
    
    public func showInView(superview: UIView) {
        if self.view.superview == nil {
            superview.addSubview(self.view)
        }
        
        self.view.center = CGPointMake(self.view.center.x, 900)
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, superview.frame.size.width, self.view.frame.size.height)
        
        UIView.animateWithDuration(0.3, delay: 0.3, options: .CurveEaseInOut, animations: { () -> Void in
            self.view.center = CGPointMake(superview.center.x, superview.frame.size.height - self.view.frame.size.height / 2)
            }, completion: nil)
        
    }
    
    public func hideInView() {
        UIView.animateWithDuration(0.3, delay: 0.0, options: .CurveEaseInOut, animations: { () -> Void in
            self.view.center = CGPointMake(self.view.center.x, 900)
            }, completion: nil)
    }
}
