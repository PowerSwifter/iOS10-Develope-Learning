//
//  AddNewWorkViewController.swift
//  AddNewItem
//
//  Created by Boshi Li on 2016/10/28.
//  Copyright © 2016年 iOSTraingCamp_Boshi Li. All rights reserved.
//

import UIKit



class AddNewWorkViewController: UIViewController {
    
    var defaults = UserDefaults.standard
    var delegate : sendDataDelegate?

    
    // MARK: - view did load
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Outlet
    @IBOutlet weak var newWorkTextView: UITextView!{
        didSet{
            self.newWorkTextView.becomeFirstResponder()
        }
    }
    
    // MARK: - Interaction
    @IBAction func tapDownBarButton(_ sender: UIBarButtonItem) {
        if delegate != nil{
            if let data = newWorkTextView.text {
                let cellDataPortInstance = cellDataPort(workData: data, workDate: Date(), workDetail: "ssssss")
                delegate?.userEnteredData(workData: cellDataPortInstance, sender: self)
                //dismiss(animated: true, completion: nil)
                _ = self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
