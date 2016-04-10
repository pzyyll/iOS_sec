//
//  ViewController.swift
//  test
//
//  Created by caizhili on 16/2/29.
//  Copyright © 2016年 caizhili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tView: UIView!
    @IBOutlet weak var tView2: UIView!
    //var label: UILabel!
    @IBOutlet weak var label: UILabel!
    
    var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.img = UIImageView(frame: CGRectMake(30, 30, 50, 50))
        self.img.image = UIImage(named: "heart")
        self.view.addSubview(self.img)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
//        self.img.bounds.origin = CGPointMake(20, 20)
//        self.img.bounds.size.height -= 20
//        self.img.bounds.size.width -= 20
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func test(sender: AnyObject) {
        UIView.animateWithDuration(3) { () -> Void in
            self.img.bounds.origin = CGPointMake(20, 20)
            self.img.bounds.size.height -= 20
            self.img.bounds.size.width -= 20
        }
        
        self.tView2.bounds.size.height += 3
        self.tView2.bounds.size.width += 3
        print(self.tView2.bounds)
        print(self.tView2.frame)
        
    }
    @IBAction func showYes(sender: UIButton) {
        self.label!.text = "yes"
        
        self.tView.bounds.origin.x -= 3
        self.tView.bounds.origin.y -= 3
        
        print(self.tView2.bounds)
        print(self.tView2.frame)
    }
 
    @IBAction func itemBtnMid(sender: UIBarButtonItem) {
        self.label!.text = "MidItem"
    }
}

