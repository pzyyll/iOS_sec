//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by 褚娜 on 16/3/6.
//  Copyright © 2016年 chuna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var boolTrashEmptyFlag = false //垃圾桶空标志 false 桶满,true 桶空
    
    var imageTrashFull : UIImage!
    var imageTrashEmpty : UIImage!

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bundle = NSBundle.mainBundle()
        let imageTrashFullPath = bundle.pathForResource("Blend Trash Full", ofType: "png")
        let imageTrashEmptyPath = bundle.pathForResource("Blend Trash Empty", ofType: "png")
        
        self.imageTrashFull = UIImage(contentsOfFile: imageTrashFullPath!)
        
        self.imageTrashEmpty = UIImage(contentsOfFile: imageTrashEmptyPath!)
        
        self.imageView.image = self.imageTrashFull
        self.imageView.userInteractionEnabled=true          //可交互, 可storyboard设置
        
        //1. 单击手势
        //代码开始
        let tapRecognizer = UITapGestureRecognizer(target: self, action: "foundTap:")
        tapRecognizer.numberOfTapsRequired = 1              //点击次数
        tapRecognizer.numberOfTouchesRequired = 1           //触点个数
        self.imageView.addGestureRecognizer(tapRecognizer)  //加载手势
        //代码结束
        
        //2. 长按手势
        let longRecognizer = UILongPressGestureRecognizer(target: self, action: "longPress:")
        longRecognizer.allowableMovement = 100.0   //最小移动距离
        longRecognizer.minimumPressDuration = 1.0  //持续时间
        self.imageView.addGestureRecognizer(longRecognizer)
        
        //3. 平移手势
        let panRecognizer = UIPanGestureRecognizer(target:self, action: "pan:")
        self.imageView.addGestureRecognizer(panRecognizer)
        
        //4. 滑动
        let swipRecognizer = UISwipeGestureRecognizer(target: self, action: "swipe:")
        swipRecognizer.direction = UISwipeGestureRecognizerDirection.Left   //从右向左
        swipRecognizer.numberOfTouchesRequired = 2
        self.view.addGestureRecognizer(swipRecognizer)
        
        //5. 旋转
        let rotationRecognizer = UIRotationGestureRecognizer(target: self, action: "rotate:")
        self.view.addGestureRecognizer(rotationRecognizer)
        
        //6. 捏合
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: "pinch:")
        self.view.addGestureRecognizer(pinchRecognizer)
        
        //7. 屏幕边缘平移
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: "edgePan:")
        edgePan.edges = UIRectEdge.Right
        self.view.addGestureRecognizer(edgePan)
    }
    
    func foundTap(sender : UITapGestureRecognizer) {
        print("单击手势")
        if boolTrashEmptyFlag {
            self.imageView.image = self.imageTrashFull
            boolTrashEmptyFlag = false
        } else {
            self.imageView.image = self.imageTrashEmpty
            boolTrashEmptyFlag = true
        }
    }
    
    func longPress(sender: UILongPressGestureRecognizer){
        print("长按手势 state = \(sender.state.rawValue)")
        if sender.state == UIGestureRecognizerState.Began {    //手势开始
            if boolTrashEmptyFlag {
                self.imageView.image = self.imageTrashFull
                boolTrashEmptyFlag = false
            }
            else{
                self.imageView.image = self.imageTrashEmpty
                boolTrashEmptyFlag = true
            }
        }
    }
    
    func pan(sender:UIPanGestureRecognizer){
        print("平移手势 state = \(sender.state.rawValue)")
        if sender.state != .Ended && sender.state != .Failed {
            let location = sender.locationInView(sender.view?.superview)
            sender.view?.center=location
        }
    }
    
    func swipe(sender:UISwipeGestureRecognizer){
        print("滑动：方向＝\(sender.direction.rawValue)")
        switch sender.direction {
        case UISwipeGestureRecognizerDirection.Down: print("向下滑")
        case UISwipeGestureRecognizerDirection.Up: print("向上")
        case UISwipeGestureRecognizerDirection.Right:print("向右")
        default:print("向左")
        }
    }
    
    var rotationAngleInRadians : CGFloat = 0
    
    func rotate(sender:UIRotationGestureRecognizer){
        print("旋转")
        /* 上一次角度加上本次旋转的角度 */
        self.imageView.transform =  CGAffineTransformMakeRotation(rotationAngleInRadians + sender.rotation)
        
        /* 手势识别完成，保存旋转的角度 */
        if (sender.state == .Ended){
            rotationAngleInRadians += sender.rotation
        }

    }
    
    var currentScale:CGFloat = 1.0
    func pinch(sender:UIPinchGestureRecognizer){
        print("捏合")
        if sender.state == .Ended {
            currentScale = sender.scale
        } else if sender.state == .Began && currentScale != 0.0 {
            sender.scale = currentScale
        }
        
        self.imageView.transform = CGAffineTransformMakeScale(sender.scale, sender.scale)
    }
    
    func edgePan(sender:UIScreenEdgePanGestureRecognizer){
        print("屏幕边缘从右向左平移")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var p1,p2:CGPoint?
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first?.locationInView(self.view)
        if p1 == nil
        {
            p1 = touch
        }
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch = touches.first?.locationInView(self.view)
        
        if p2 == nil || ( p1?.x < touch?.x && p1?.y < touch?.y)
        {
            p2 = touch
        }
        
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first?.locationInView(self.view)
        
        if p2 != nil && p1 != nil
        {
            if touch?.x > p2?.x && touch?.y < p1?.y
            {
                //self.label.text = "✔️"
                print("✔︎")
            }
        }
        p1 = nil
        p2 = nil
    }

    


}

