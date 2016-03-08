//
//  DetailViewController.swift
//  TreeNavigation
//
//  Created by 褚娜 on 16/3/3.
//  Copyright © 2016年 chuna. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    var url: String!
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = NSURL(string: self.url)
        let request = NSURLRequest(URL: url!)
        self.webView.loadRequest(request)
        self.webView.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //UIWebViewDelegate委托定义方法
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        print("error : %@", error!)
    }
    
    //UIWebViewDelegate委托定义方法
    func webViewDidFinishLoad(webView: UIWebView) {
        print("finish")
    }


}
