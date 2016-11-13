//
//  ViewController.swift
//  passingDataWithDelegate
//
//  Created by Boshi Li on 2016/10/29.
//  Copyright © 2016年 iOS TraingCamp-Boshi. All rights reserved.
//

import UIKit

class RecevingViewController: UIViewController, DataSentDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var RecevingLabel: UILabel!
    
    func userDidEnter(Data data: String) {
        RecevingLabel.text = data
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goSendingVC" {
            if let SVC = segue.destination as? SendingViewController{
                SVC.delegate = self
            }
        }
    }
}

