//
//  SendingViewController.swift
//  passingDataWithDelegate
//
//  Created by Boshi Li on 2016/10/29.
//  Copyright © 2016年 iOS TraingCamp-Boshi. All rights reserved.
//

import UIKit

protocol DataSentDelegate {
    func userDidEnter(Data data: String)
}

class SendingViewController: UIViewController {

    @IBOutlet weak var dataEntryTextField: UITextField!
    
    var delegate: DataSentDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func sendingButtonPressed(_ sender: UIButton) {
        if delegate != nil {
            if let data = dataEntryTextField.text{
                delegate?.userDidEnter(Data: data)
                dismiss(animated: true, completion: nil)
            }
        }
    }
}
