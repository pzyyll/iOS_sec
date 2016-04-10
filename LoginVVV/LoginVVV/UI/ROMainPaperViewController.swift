//
//  ROMainPaperViewController.swift
//  LoginVVV
//
//  Created by CAIZHILI on 16/4/6.
//  Copyright © 2016年 CAIZHILI. All rights reserved.
//

import UIKit

class ROMainPaperViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = NSURL(string: "http://www.html5tricks.com/demo/html5-css3-car-animation/index.html")
        var request = NSMutableURLRequest(URL: url!, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60)
        webView.loadRequest(request)
        webView.scrollView.scrollEnabled = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
