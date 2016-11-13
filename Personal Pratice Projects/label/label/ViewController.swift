//
//  ViewController.swift
//  label
//
//  Created by Boshi Li on 2016/10/18.
//  Copyright © 2016年 iOSTraingCamp_Boshi Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var powerID: UILabel!
    @IBOutlet weak var powerBoss: UILabel!
    @IBOutlet weak var powerAddress: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        powerID.text = "00ff00"
        powerBoss.text = "豆芽女王"
        powerAddress.text = "Power Base"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

