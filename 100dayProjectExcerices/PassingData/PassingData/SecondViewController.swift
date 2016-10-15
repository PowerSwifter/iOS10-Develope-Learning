//
//  SecondViewController.swift
//  PassingData
//
//  Created by Boshi Li on 2016/10/15.
//  Copyright © 2016年 iOSTraingCamp_Boshi Li. All rights reserved.
//

import UIKit

var savedMessage: String?

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: - Outlet
    
    @IBOutlet weak var savaMessageLabel: UILabel!
    
    // MARK: - Functions
    
    func updateUI(){
        if let getMessage = savedMessage{
            savaMessageLabel.text = getMessage
        }
        
    }

}
