//
//  ViewController.swift
//  GetCurrentTimeAndDate
//
//  Created by Boshi Li on 2016/9/18.
//  Copyright © 2016年 iOSTraingCamp_Boshi Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let model = currentTimeModel()
    
    @IBOutlet weak var displayCurrentTime: UILabel!
    
    
    @IBAction func refreshTimeBtn(sender: UIButton) {
        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in })
        timer.fire()
        
    }
    
    private func refreshTimer(timer:Timer) {
        let newDate = model.getCurrentTime()
        displayCurrentTime.text = newDate
    }
    
}

