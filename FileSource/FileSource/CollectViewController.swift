//
//  CollectViewController.swift
//  FileSource
//
//  Created by caizhili on 16/3/16.
//  Copyright © 2016年 caizhili. All rights reserved.
//

import UIKit

class CollectViewController: UIViewController, UITextFieldDelegate {

    var fileOperate = ViewController()
    
    
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var displayView: UITextView!
    
    @IBAction func save(sender: UIButton) {
        let csvLine = "\(self.lastName.text!),\(self.firstName.text!),\(self.email.text!)\n"
        let docPath = fileOperate.dirDoc()
        let surveyFilePath = docPath + "/survey.csv"
        
        let fileManager = NSFileManager.defaultManager()
        if !fileManager.fileExistsAtPath(surveyFilePath) {
            fileManager.createFileAtPath(surveyFilePath, contents: nil, attributes: nil)
        }
        
        let fileHandler = NSFileHandle(forUpdatingAtPath: surveyFilePath)
        fileHandler?.seekToEndOfFile()
        fileHandler?.writeData(csvLine.dataUsingEncoding(NSUTF8StringEncoding)!)
        fileHandler?.closeFile()
        
        self.lastName.text = ""
        self.firstName.text = ""
        self.email.text = ""
    }
    
    @IBAction func display(sender: UIButton) {
        let docPath = fileOperate.dirDoc()
        let surveyFilePath = docPath + "/survey.csv"
        
        let fileManager = NSFileManager.defaultManager()
        
        if fileManager.fileExistsAtPath(surveyFilePath) {
            let fileHandler = NSFileHandle(forReadingAtPath: surveyFilePath)
            let data = fileHandler?.availableData
            self.displayView.text = String(data: data!, encoding: NSUTF8StringEncoding)
            
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.firstName.delegate = self
        self.lastName.delegate = self
        self.email.delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return true
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
