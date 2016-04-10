//
//  DispalyTableViewController.swift
//  ComNav
//
//  Created by CAIZHILI on 16/3/24.
//  Copyright © 2016年 CAIZHILI. All rights reserved.
//

import UIKit

class DispalyTableViewController: UITableViewController {

    var dictData: NSMutableDictionary!
    var listData: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        let path = NSBundle.mainBundle().pathForResource("provinces_cities", ofType: "plist")
        self.dictData = NSMutableDictionary(contentsOfFile: path!)
        let str = self.navigationController?.tabBarItem.title!
        print(str)
        
        switch str! {
        case "黑龙江":
            self.listData = self.dictData["黑龙江"] as! NSMutableArray
            self.navigationItem.title = "黑龙江"
        case "吉林":
            self.listData = self.dictData["吉林"] as! NSMutableArray
            self.navigationItem.title = "吉林"
        case "辽宁":
            self.listData = self.dictData["辽宁"] as! NSMutableArray
            self.navigationItem.title = "辽宁"
        default:
            break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.listData.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        // Configure the cell...
        let dict = self.listData[indexPath.row] as! NSMutableDictionary
        cell.textLabel?.text = dict["name"] as? String
        cell.accessoryType = .DisclosureIndicator
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "detail") {
            let ctr = segue.destinationViewController as! DetailViewController
            let index = self.tableView.indexPathForSelectedRow?.row
            print(index)
            let dict = self.listData[index!] as! NSMutableDictionary
            ctr.url = dict["url"] as! String
            ctr.title = dict["name"] as? String
        }
    }
}


