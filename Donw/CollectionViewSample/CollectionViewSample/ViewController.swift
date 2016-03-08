//
//  ViewController.swift
//  CollectionViewSample
//
//  Created by 褚娜 on 16/2/28.
//  Copyright © 2016年 chuna. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    var events : NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let plistPath = NSBundle.mainBundle().pathForResource("events", ofType: "plist")
        //获取属性列表文件中的全部数据
        self.events = NSArray(contentsOfFile: plistPath!)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //UICollectionViewDataSource
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return self.events.count / 2
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! Cell
        let event = self.events[indexPath.section*2 + indexPath.row] as! NSDictionary
        
        cell.label.text = event["name"] as? String
        let imageFile = event["image"] as! String
        cell.imageView.image = UIImage(named: imageFile)
        
        return cell
    }
    
    //UICollectionViewDelegate
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let event = self.events[indexPath.section*2 + indexPath.row] as! NSDictionary
        NSLog("select event name : %@", event["name"] as! String)
    }
}

