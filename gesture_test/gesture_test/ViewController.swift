//
//  ViewController.swift
//  gesture_test
//
//  Created by caizhili on 16/3/9.
//  Copyright © 2016年 caizhili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var boolTrashEmptyFlag = false
    var imgTrashFull: UIImage!
    var imgTrashEmpty: UIImage!
    
    @IBOutlet weak var img1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let bundle = NSBundle.mainBundle()
        
        let imgTFPath = bundle.pathForResource("img1", ofType: ".jpg")
        let imgTEPath = bundle.pathForResource("img2", ofType: ".jpg")
        
        self.imgTrashFull = UIImage(contentsOfFile: imgTFPath!)
        self.imgTrashEmpty = UIImage(contentsOfFile: imgTEPath!)
        
        self.img1.image = self.imgTrashFull
        self.img1.userInteractionEnabled = true
        
        //单击
//        let tapRecognizer = UITapGestureRecognizer(target: self, action: "foundTap:")
//        tapRecognizer.numberOfTapsRequired = 1          //单击次数
//        tapRecognizer.numberOfTouchesRequired = 1       //触点个数
//        self.img1.addGestureRecognizer(tapRecognizer)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

