//
//  ViewController.swift
//  Tap Me
//
//  Created by Boshi Li on 2016/7/2.
//  Copyright © 2016年 Boshi Li. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var scoreLable : UILabel!
    @IBOutlet var timerLable : UILabel!
    
    var buttonBeep : AVAudioPlayer?
    var seccondBeep : AVAudioPlayer?
    var backgroundMusic : AVAudioPlayer?
    
    var count = 0
    var seconds = 0
    var timer  = NSTimer()
    
    
    @IBAction func buttonPressed(){
        
        count += 1
        NSLog("Button Pressed")
        scoreLable.text = "Score \(count)"
    }
    
    func setupGame() {
        seconds = 5
        count = 0
        timer = NSTimer.scheduledTimerWithTimeInterval(
            1.0,
            target: self,
            selector: #selector(ViewController.subtractTime),
            userInfo: nil,
            repeats: true)
        timerLable.text = "Time: \(seconds)"
        scoreLable.text = "Score: \(count)"
    }
        

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_tile.png")!)
        scoreLable.backgroundColor = UIColor(patternImage: UIImage(named: "field_score.png")!)
        timerLable.backgroundColor = UIColor(patternImage: UIImage(named: "field_time.png")!)
        setupGame()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func subtractTime(){
        seconds -= 1
        timerLable.text = "Time: \(seconds)"
        
        if(seconds == 0){
            let timeAlert = UIAlertController(
                title: "Time is up",
                message: "You scored \(count) points",
                preferredStyle: UIAlertControllerStyle.Alert)
            
            timeAlert.addAction(UIAlertAction(
                title: "Play Again",
                style: UIAlertActionStyle.Default,
                handler: {
                    action in self.setupGame()}
                ))
            timer.invalidate()
            presentViewController(timeAlert, animated: true, completion:nil)
        }
    }

}

