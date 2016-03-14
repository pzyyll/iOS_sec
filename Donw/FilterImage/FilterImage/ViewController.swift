//
//  ViewController.swift
//  FilterImage
//
//  Created by 褚娜 on 16/3/13.
//  Copyright © 2016年 chuna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    var image : UIImage!
    
    // 0 为CISepiaTone 1 为CIGaussianBlur
    var flag  = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.image = UIImage(named: "SkyDrive340.png")
        self.imageView.image = self.image
        self.label.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeValue(sender: AnyObject) {
        
        let slider  = sender as! UISlider
        let value :Float = slider.value
        
        if self.flag == 0 {
            self.filterSepiaTone(value)
        } else if self.flag == 1 {
            self.filterGaussianBlur(value)
        }
    }
    
    
    @IBAction func segmentSelected(sender: AnyObject) {
        
        let seg  = sender as! UISegmentedControl
        
        if (seg.selectedSegmentIndex == 0) {//旧色调
            flag = 0;
        } else { //高斯模糊
            flag = 1;
        }
    }
    
    func filterSepiaTone(value : Float) {
        
        let context = CIContext(options: nil)
        let cImage = CIImage(CGImage: self.image.CGImage!)
        
        let sepiaTone = CIFilter(name: "CISepiaTone")
        sepiaTone!.setValue(cImage, forKey: "inputImage")
        
        let text = String(format: "旧色调 Intensity : %.2f", value)
        self.label.text = text
        
        sepiaTone!.setValue(value, forKey: "inputIntensity")
        let result = sepiaTone!.valueForKey("outputImage") as! CIImage
        
        let imageRef = context.createCGImage(result, fromRect: CGRectMake(0, 0, self.imageView.image!.size.width, self.imageView.image!.size.height))
        
        let image =  UIImage(CGImage: imageRef)
        
        self.imageView.image = image
        
        flag = 0
    }
    
    
    func filterGaussianBlur(value : Float) {
        
        let context = CIContext(options: nil)
        let cImage = CIImage(CGImage: self.image.CGImage!)
        
        let gaussianBlur = CIFilter(name: "CIGaussianBlur")
        gaussianBlur!.setValue(cImage, forKey: "inputImage")
        
        let text = String(format: "高斯模糊 Radius : %.2f",value * 10)
        self.label.text = text
        
        gaussianBlur!.setValue(value, forKey: "inputRadius")
        let result = gaussianBlur!.valueForKey("outputImage") as! CIImage
        
        let imageRef = context.createCGImage(result, fromRect: CGRectMake(0, 0, self.imageView.image!.size.width, self.imageView.image!.size.height))
        
        let image =  UIImage(CGImage: imageRef)
        self.imageView.image = image
        
        flag = 1
    }



}

