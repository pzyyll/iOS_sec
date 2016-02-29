//
//  ViewController.swift
//  t2
//
//  Created by caizhili on 16/2/29.
//  Copyright © 2016年 caizhili. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var listTeams: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let plistPath = NSBundle.mainBundle().pathForResource("team", ofType: "plist")
        self.listTeams = NSArray(contentsOfFile: plistPath!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //协议实现方法
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listTeams!.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifier  = "item0"
        let aCell = tableView.dequeueReusableCellWithIdentifier(identifier)!
        
        //config
        let row = indexPath.row
        let rowDict = self.listTeams[row] as! NSDictionary
        
        aCell.textLabel!.text = rowDict["name"] as? String
        
        let imgPath = String(format: "%@.png", rowDict["image"] as! String)
        aCell.imageView?.image = UIImage(named: imgPath)
        aCell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return aCell
    }


}

