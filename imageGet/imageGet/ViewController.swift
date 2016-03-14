//
//  ViewController.swift
//  imageGet
//
//  Created by caizhili on 16/3/14.
//  Copyright © 2016年 caizhili. All rights reserved.
//

import UIKit

let FILE_NAME = "3.jpg"

class ViewController: UIViewController {

    @IBOutlet weak var showImg: UIImageView!
    
    //var imgPicker = UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.showImg.image = UIImage(named: "0.jpg")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func localLib(sender: UIButton) {
        let path = NSBundle.mainBundle().pathForResource("1", ofType: "jpg")
        let img = UIImage(contentsOfFile: path!)
        
        self.showImg.image = img
    }

    @IBAction func bundleLoad(sender: UIButton) {
        
    }
    
    func appDocDirFile() -> String {
        let docDirs: NSArray = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let docDir = docDirs[0] as! String
        let path = (docDir as NSString).stringByAppendingPathComponent(FILE_NAME)
        
        return path
    }
    
    func createEdiCopyOfDatabaseIfNeeded() {
        let fileManager = NSFileManager.defaultManager()
        
        let writableDBPath = self.appDocDirFile()
        let dbexits = fileManager.fileExistsAtPath(writableDBPath)
        if !dbexits {
            let defaultDBPath = ((NSBundle.mainBundle().resourcePath)! as NSString).stringByAppendingPathComponent(FILE_NAME)
        }
    }
    @IBAction func webLoad(sender: UIButton) {
    }
    @IBAction func pickPhotoLib(sender: UIButton) {
        
    }
}

