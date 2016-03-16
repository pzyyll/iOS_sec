//
//  ViewController.swift
//  FileSource
//
//  Created by caizhili on 16/3/16.
//  Copyright © 2016年 caizhili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //return the All address of Documents dir
    func dirDoc() -> String {
        //have 3 way
        //let path = NSHomeDirectory() + "/Documents"
        //let path = (NSHomeDirectory() as NSString).stringByAppendingPathComponent("Documents")
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let path = paths[0]
        return path
    }
    
    //return the All address of Library dir
    func dirLib() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.LibraryDirectory, .UserDomainMask, true)
        let path = paths[0]
        return path
    }
    
    //return the caches dir
    func dirCaches() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true)
        let path = paths[0]
        return path
    }
    
    //return the temp dir
    func dirTemp() -> String {
        return NSTemporaryDirectory()
    }
    
    //create a doc in the Documents
    func createDir(dir: String) {
        let docPath = self.dirDoc()
        let testDir = docPath + "/\(dir)"
        
        //fileManager obj
        let fileManager = NSFileManager.defaultManager()
        do {
            try fileManager.createDirectoryAtPath(testDir, withIntermediateDirectories: true, attributes: nil)
        } catch {
            print("dir create to fail")
        }
    }
    
    //create a file in a dir
    func createFile(filePath: String, fileName: String) {
        //fileManager obj
        let fileManager = NSFileManager.defaultManager()
        let testPath = filePath.stringByAppendingString("/\(fileName)")
        
        let rSuc = fileManager.createFileAtPath(testPath, contents: nil, attributes: nil)
        if rSuc {
            print("File create to success")
        } else {
            print("File create to fail")
        }
    }
    
    //File attributes
    func getFileAttribute(filePath: String, fileName: String) {
        //fileManager obj
        let fileManager = NSFileManager.defaultManager()
        var fileAttrs = [String: AnyObject]()
        
        do {
            fileAttrs = try fileManager.attributesOfItemAtPath(filePath + "/" + fileName)
            for key in fileAttrs.keys {
                print("key: \(key), value: \(fileAttrs[key]!)")
            }
        } catch {
            
        }
    }
    
    //delete file
    func deleteFile(filePath: String, fileName: String) -> Bool {
        //fileManager obj
        let fileManager = NSFileManager.defaultManager()
        let testPath = filePath + "/" + fileName
        if fileManager.fileExistsAtPath(testPath) {
            do {
                try fileManager.removeItemAtPath(testPath)
                return true
            } catch {
                print("file delete fail")
                return false
            }
        } else {
            print("file is not exit")
            return false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        print(self.dirDoc())
//        createDir("first/3/5")
//        createFile(self.dirDoc(), fileName: "abc.txt")
//        getFileAttribute(self.dirDoc(), fileName: "abc.txt")
//        deleteFile(self.dirDoc(), fileName: "abc.txt")
        
        let good = Goods()
        good.id = "1"
        good.name = "iPhone6"
        good.price = 1000.8
        
        //txt file RW
        let fileName = "goods.txt"
        let filePath = self.dirDoc() + "/" + fileName
        let fileManager = NSFileManager.defaultManager()
        if fileManager.fileExistsAtPath(filePath) {
            do {
                let content = try String(contentsOfFile: filePath)
                print(content)
            } catch {
                print("file read fai")
            }
        } else {
            print("file is not exitsts")
            let content = String(format: "%i, %@, %f", good.id, good.name, good.price)
            try! content.writeToFile(filePath, atomically: true, encoding: NSUTF8StringEncoding)
        }
        
        //plist file RW
        //NSNumber, NSString, NSArray, NSDictionary
        let info = [good.name, good.price]
        let idStr = good.id
        print(idStr)
        let myDic: NSMutableDictionary = [idStr: info]
        let plistPath = self.dirDoc() + "/prodcut.plist"
        if !fileManager.fileExistsAtPath(plistPath) {
            myDic.writeToFile(plistPath, atomically: true)
        } else {
            let result = NSMutableDictionary(contentsOfFile: plistPath)
            print(result)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

