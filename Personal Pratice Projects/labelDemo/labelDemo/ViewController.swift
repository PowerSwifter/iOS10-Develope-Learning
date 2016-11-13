//
//  ViewController.swift
//  labelDemo
//
//  Created by Boshi Li on 2016/11/10.
//  Copyright © 2016年 iOS TraingCamp-Boshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

@IBOutlet weak var powerLabel: UILabel!
override func viewDidLoad() {
    super.viewDidLoad()
    powerLabel.text = "秘密基地"
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

