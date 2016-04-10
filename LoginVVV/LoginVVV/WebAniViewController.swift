//
//  WebAniViewController.swift
//  LoginVVV
//
//  Created by CAIZHILI on 16/4/7.
//  Copyright © 2016年 CAIZHILI. All rights reserved.
//

import UIKit
import WebKit

class WebAniViewController: UIViewController {

    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView = WKWebView(frame: CGRectMake(0, 50, self.view.frame.width, 500));
        let url = NSURL(string: "http://www.html5tricks.com/demo/html5-hair-animation/index.html")
        var request = NSMutableURLRequest(URL: url!, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60)
        self.webView.loadRequest(request)
        self.webView.scrollView.scrollEnabled = false
        self.webView.backgroundColor = UIColor.blackColor()
        self.view.addSubview(webView)
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
