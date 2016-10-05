//
//  ViewController.swift
//  GetCurrentTime
//
//  Created by Boshi Li on 2016/7/16.
//  Copyright © 2016年 Boshi Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var timeLabel: UILabel!
    
    

    //set a formater to transfer NSDate to String

    
    @IBAction func refreshBtn(sender: AnyObject) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        transDatetoString()
    }
    
    func transDatetoString() {

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

