//
//  ViewController.swift
//  t3
//
//  Created by caizhili on 16/3/2.
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

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listTeams.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let id = "cellIdentifier"
        
        let cell: myTableViewCell! = tableView.dequeueReusableCellWithIdentifier(id, forIndexPath: indexPath) as? myTableViewCell
        
        let row = indexPath.row
        let rowDict = self.listTeams[row] as! NSDictionary
        
        cell.m_Label!.text = rowDict["name"] as? String
        
        let imgFile = rowDict["image"] as! String
        let imgPath = String(format: "%@.png", imgFile)
        cell.m_ImageView!.image = UIImage(named: imgPath)
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }

}

