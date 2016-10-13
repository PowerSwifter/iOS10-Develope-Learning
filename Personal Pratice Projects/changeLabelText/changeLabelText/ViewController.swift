//
//  ViewController.swift
//  changeLabelText
//
//  Created by Boshi Li on 2016/10/12.
//  Copyright © 2016年 iOSTraingCamp_Boshi Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        labelDisplay.backgroundColor = UIColor.blue
    }

    @IBOutlet weak var mfiles: UITextField!
    @IBOutlet weak var labelDisplay: UILabel!
    func textFieldDidBeginEditing(_ textField: UITextField) {
        mfiles.becomeFirstResponder()
    }

    @IBAction func pressMeBtn(_ sender: UIButton) {
        labelDisplay.text = "安安😂"
    }

}

