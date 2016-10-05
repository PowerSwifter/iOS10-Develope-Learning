//
//  ViewController.swift
//  Tap Counter
//
//  Created by Boshi Li on 2016/7/15.
//  Copyright © 2016年 Boshi Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var counterLabel:UILabel!
    var count = 0

    
    @IBAction func tapButtonPressed(){
        count += 1
        counterLabel.text = "\(count)"
        
    }
    
    @IBAction func resetButtonPressed(){
        count = 0
        counterLabel.text = "\(count)"
    }


}

