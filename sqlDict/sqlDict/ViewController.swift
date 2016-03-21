//
//  ViewController.swift
//  sqlDict
//
//  Created by caizhili on 16/3/21.
//  Copyright © 2016年 caizhili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var wordField: UITextField!
    @IBOutlet weak var detailField: UITextField!
    @IBOutlet weak var queryField: UITextField!
    @IBOutlet weak var displayView: UITextView!
    
    var db: SQLiteDB!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.db = SQLiteDB.sharedInstance()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //关联文本框
    @IBAction func finishEdit(sender: UITextField) {
        sender.resignFirstResponder()
    }

    @IBAction func addWord(sender: AnyObject) {
        db.execute("create table if not exists t_dict(uid integer primary key, word varchar(20), detail varchar(50))")
        
        self.saveWord()
    }
    
    @IBAction func queryAction(sender: AnyObject) {
        let sql = "select * from t_dict where word = '\(self.queryField.text!)'"
        //let sql = "select * from t_dict"
        let data = db.query(sql)
        self.displayView.text.removeAll()
        if data.count != 0 {
            for u in data {
                self.displayView.text! += "单词：\(u["word"] as! String)\n解释：\(u["detail"] as! String)\n"
            }
        }
        
//        for u in data {
//            self.displayView.text! += "单词：\(u["word"] as! String)\n解释：\(u["detail"] as! String)"
//        }
    }
    
    func saveWord() {
        let word = self.wordField.text
        let detail = self.detailField.text
        if (word?.characters.count > 0 && detail?.characters.count > 0) {
            let sql = "insert into t_dict(word, detail) values('\(word!)','\(detail!)')"
            print(sql)
            let res = db.execute(sql)
            print(res)
        }
    }
}

