//
//  ViewController.swift
//  MediaPlay
//
//  Created by caizhili on 16/3/14.
//  Copyright © 2016年 caizhili. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {


    var playerController: AVPlayerViewController!
    var videoRecordCtr: UIImagePickerController!
    var recorder: AVAudioRecorder!
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func localPlay(sender: UIButton) {
        if self.playerController == nil {
            self.playerController = AVPlayerViewController()
            
            let path = NSBundle.mainBundle().pathForResource("GoodTime", ofType: "m4v")
            print(path)
            self.playerController.player = AVPlayer(URL: NSURL(fileURLWithPath: path!))
            self.presentViewController(self.playerController, animated: true, completion: { () -> Void in
                self.playerController.player?.play()
            })
        }
    }

    //播放网络视频
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! AVPlayerViewController
        let url = NSURL(string: "http://8.8.8.251/youku/69721F688BB408138B8B3B36AD/030008010056E27A840D1106EA71FA8E086B7E-BE7C-A058-43AC-0F2937E6730E.mp4")
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            destination.player = AVPlayer(URL: url!)
        }
    }
    
    @IBAction func audioRecord(sender: UIButton) {
        if self.recorder == nil {
            var settings = [String: Int]()
            settings[AVFormatIDKey] = Int(kAudioFormatLinearPCM)  //录音格式
            settings[AVSampleRateKey] = 44100
            settings[AVNumberOfChannelsKey] = 1       //声道
            settings[AVLinearPCMBitDepthKey] = 16     //采样位数
            settings[AVLinearPCMIsBigEndianKey] = 0   //音频编码小字节
            settings[AVLinearPCMIsFloatKey] = 0       //音频解码浮点数
            
            //获取沙箱中Document目录下录音文件的路径
            let filePath = String(format: "%@/rec.caf", self.getDocumentDir())
            let fileURL = NSURL.fileURLWithPath(filePath)
            //初始化录音机
            do {
                self.recorder = try AVAudioRecorder(URL: fileURL, settings: settings)
            } catch let er as NSError {
                print(er.description)
                self.recorder = nil
            }
            
            //录音控制
            if self.recorder.recording {
                return
            }
            if self.player != nil && self.player.playing {
                self.player.stop()
            }
            self.recorder.record()
            print("recording")
        }
    }
    
    func getDocumentDir() -> String {
        let paths: NSArray = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, .UserDomainMask, true)

        return paths[0] as! String
    }
    
    @IBAction func stop(sender: UIButton) {
        //录停
        if self.recorder != nil && self.recorder.recording {
            self.recorder.stop()
            self.recorder = nil
            //self.recorder.delegate = nil
            self.recorder = nil
        }
        //播停
        if self.player != nil && self.player.playing {
            self.player.stop()
        }
    }
    
    @IBAction func play(sender: UIButton) {
        self.stop(sender)
        
        //获取沙箱中Document目录下录音文件的路径
        let filePath = String(format: "%@/rec.caf", self.getDocumentDir())
        let fileURL = NSURL.fileURLWithPath(filePath)
        
        do {
            self.player = try AVAudioPlayer(contentsOfURL: fileURL)
            self.player.play()
        } catch let err as NSError {
            print(err.description)
            self.player = nil
        }
    }
    
    @IBAction func videoRecord(sender: UIButton) {
        
    }
}

