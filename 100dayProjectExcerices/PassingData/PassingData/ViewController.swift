//
//  ViewController.swift
//  PassingData
//
//  Created by Boshi Li on 2016/10/15.
//  Copyright © 2016年 iOSTraingCamp_Boshi Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        firstViewTextField.becomeFirstResponder()
    }

    @IBOutlet weak var firstViewTextField: UITextView!{
        didSet{
            changeTextProperites(anyLabel: firstViewTextField)
        }

    }

    func changeTextProperites(anyLabel: AnyObject){
        if let label = anyLabel as? UITextView{
            label.textColor = UIColor.gray
            label.font = UIFont.systemFont(ofSize: 30)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        savedMessage = firstViewTextField.text
    }

}

