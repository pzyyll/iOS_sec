//
//  MyEventListTableViewController.swift
//  CoreDataSample
//
//  Created by caizhili on 16/3/21.
//  Copyright © 2016年 caizhili. All rights reserved.
//

import UIKit
import CoreData

class MyEventListTableViewController: UITableViewController {

    var appDelegate: AppDelegate!
    var eventArray: NSMutableArray!
    
    @IBOutlet weak var delBtn: UIBarButtonItem!
    @IBAction func delAction(sender: AnyObject) {
        if (self.delBtn.title == "Del") {
            self.tableView.setEditing(true, animated: true)
            self.delBtn.title = "Finish"
        } else {
            self.tableView.setEditing(false, animated: true)
            self.delBtn.title = "Del"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.appDelegate = (UIApplication.sharedApplication().delegate) as! AppDelegate
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let request: NSFetchRequest = NSFetchRequest()
        
        let entity: NSEntityDescription? = NSEntityDescription.entityForName("MyEvent", inManagedObjectContext: self.appDelegate.managedObjContext!)
        
        request.entity = entity
        
        do {
            let ab = try self.appDelegate.managedObjContext?.executeFetchRequest(request)
            eventArray = NSMutableArray(array: ab!)
        } catch let er as NSError {
            print(er.userInfo)
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
        return eventArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("event", forIndexPath: indexPath)

        // Configure the cell...
        let test: MyEvent  = self.eventArray![indexPath.row] as! MyEvent
        
        cell.textLabel?.text = test.name
        cell.detailTextLabel?.text = test.happenDate?.description
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    override func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "确认删除"
    }
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            let deleteEvent: MyEvent = self.eventArray[indexPath.row] as! MyEvent
            self.appDelegate.managedObjContext?.deleteObject(deleteEvent)
            do {
                try self.appDelegate.managedObjContext?.save()
                eventArray.removeObject(deleteEvent)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
                
            } catch let er as NSError {
                print(er.userInfo)
            }
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}