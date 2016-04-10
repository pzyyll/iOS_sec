//
//  ViewController.swift
//  rectT
//
//  Created by CAIZHILI on 16/3/27.
//  Copyright © 2016年 CAIZHILI. All rights reserved.
//

import UIKit
//import QuartzCore

let Pi: CGFloat = 3.1415
let g = 9.8 * 20

func degreer(d:CGFloat) -> CGFloat {
    return (d * Pi / 180)
}

extension Double {
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
}
extension CGFloat {
    var double: Double {
        return Double(self)
    }
}

class ViewController: UIViewController {



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        //let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: .BottomLeft, cornerRadii: CGSizeMake(50, 50))

        
        let aLayer = CAShapeLayer()
        aLayer.frame = CGRectMake(0, 0, 30, 30)
        aLayer.fillColor = UIColor.blueColor().CGColor
        aLayer.position = self.view.center
        aLayer.position.y -= 300
        let path = UIBezierPath(ovalInRect: aLayer.bounds)
        aLayer.path = path.CGPath
        aLayer.anchorPoint.y = 1
        
        self.view.layer.addSublayer(aLayer)


        let ani = CABasicAnimation(keyPath: "transform")
        var trans = CATransform3DIdentity
        //trans.m14 = -1/99
        trans = CATransform3DRotate(trans,Pi*3, 0, 0, 1)
        ani.fromValue = NSValue(CATransform3D: CATransform3DIdentity)
        ani.toValue = NSValue(CATransform3D: trans)//NSValue(CGPoint: CGPoint(x: 50, y: 50))
        //ani.autoreverses = true
        //ani.fillMode = kCAFillModeForwards
        //ani.removedOnCompletion = false
        ani.repeatCount = MAXFLOAT
        ani.duration = 2
        
        let aniKeys = CAKeyframeAnimation(keyPath: "transform.translation.y")
        let distance:CGFloat = 400
        aniKeys.values = self.getValuesForFreefallD(2000, distance: distance)
        aniKeys.keyTimes = self.getTimesForFreefall(2000, distance: distance)
        aniKeys.repeatCount = MAXFLOAT
        aniKeys.duration = CFTimeInterval(self.getTimeForFreefall(distance))
        aniKeys.autoreverses = true
        
//        let ani2 = CABasicAnimation(keyPath: "positon")
//        ani2.fromValue = NSNumber
        let aniScale = CAKeyframeAnimation(keyPath: "transform")
        let transScale = CATransform3DMakeScale(1.2, 0.6, 1)
        
        aniScale.values = [NSValue(CATransform3D: CATransform3DIdentity),NSValue(CATransform3D: CATransform3DIdentity), NSValue(CATransform3D: transScale)]
        aniScale.keyTimes = [NSNumber(double: 0), NSNumber(double: 0.94), NSNumber(double: 1)];
        aniScale.repeatCount = MAXFLOAT
        aniScale.duration = CFTimeInterval(self.getTimeForFreefall(distance))
        aniScale.autoreverses = true
        
        let aniGrounp = CAAnimationGroup()
        aniGrounp.animations = [aniScale, aniKeys]
        aniGrounp.autoreverses = true
        aniGrounp.repeatCount = MAXFLOAT
        aniGrounp.duration = CFTimeInterval(self.getTimeForFreefall(distance))
        //aLayer.transform = trans
        //aLayer.addAnimation(ani, forKey: "anis")
        aLayer.addAnimation(aniGrounp, forKey: "aniKeys");
        
        let aLayer2 = self.createDD();
        aLayer2.position.x = self.view.frame.width * (2/3)
        aLayer2.position.y -= 300
        
        let aniScale2 = CAKeyframeAnimation(keyPath: "transform")
        aniScale2.values = [NSValue(CATransform3D: CATransform3DIdentity),NSValue(CATransform3D: transScale)];
        aniScale2.keyTimes = [NSNumber(double: 0),NSNumber(double: 1)];
        aniScale2.duration = 1
        aniScale2.beginTime = CFTimeInterval(self.getTimeForFreefall(distance))
        
        aniScale2.fillMode = kCAFillModeBackwards
        //aniScale2.autoreverses = true
        //aniScale2.repeatCount = MAXFLOAT
        
        let aniGroup2 = CAAnimationGroup()
        aniGroup2.autoreverses = true
        aniGroup2.repeatCount = MAXFLOAT
        aniGroup2.animations = [aniScale2, aniKeys]
        aniGroup2.duration = aniKeys.duration + 1
        
        aLayer2.addAnimation(aniGroup2, forKey: "aniGroup2")
        self.view.layer.addSublayer(aLayer2)
    }

    @IBAction func act(sender: AnyObject) {

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func getValuesForFreefallD(divs: Int, distance: CGFloat) -> [AnyObject]? {
        var nsnumbers = [NSNumber]()
        let partTime = self.getTimeForFreefall(distance) / CGFloat(divs);
        nsnumbers.append(NSNumber(double: 0));
        var t = partTime;
        for _ in 0..<(divs-1) {
            let d = g.cgFloat*t*t / 2;
            nsnumbers.append(NSNumber(double: d.double))
            t += partTime;
        }
        nsnumbers.append(NSNumber(double: distance.double))
        print(nsnumbers)
        return nsnumbers
    }
    
    func getTimeForFreefall(distance: CGFloat) -> CGFloat {
        return sqrt(2 * distance / g.cgFloat);
    }
    
    func getTimesForFreefall(divs: Int, distance: CGFloat) -> [NSNumber]
    {
        var nsnumbers = [NSNumber(double: 0)];
        let partTime = 1.0 / CGFloat(divs)
        var t = partTime;
        for _ in 0..<(divs - 1) {
            nsnumbers.append(NSNumber(double: t.double))
            t += partTime;
        }
        nsnumbers.append(NSNumber(double: 1))
        print(nsnumbers)
        return nsnumbers
        
    }
    
    func createDD() -> CALayer {
        let aLayer = CAShapeLayer()
        aLayer.frame = CGRectMake(0, 0, 30, 30)
        aLayer.fillColor = UIColor.blueColor().CGColor
        aLayer.position = self.view.center

        let path = UIBezierPath(ovalInRect: aLayer.bounds)
        aLayer.path = path.CGPath
        aLayer.anchorPoint.y = 1
        
        return aLayer
    }
}

