//
//  DetailViewController.swift
//  ComNav
//
//  Created by CAIZHILI on 16/3/24.
//  Copyright © 2016年 CAIZHILI. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var url: String!
    @IBOutlet weak var web: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(url)
        self.web.loadRequest(NSURLRequest(URL: NSURL(string: url!)!))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var add: UIBarButtonItem!

    @IBAction func addAction(sender: AnyObject) {
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let ctr = segue.destinationViewController as! UINavigationController
        ctr.viewControllers[0].title = self.title
    }
    

}
