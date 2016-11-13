//
//  AddNewWorkViewController.swift
//  AddNewItem
//
//  Created by Boshi Li on 2016/10/28.
//  Copyright © 2016年 iOSTraingCamp_Boshi Li. All rights reserved.
//

import UIKit

class AddNewWorkViewController: UIViewController {

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
        toDoListModel.dataArr.append(newWorkTextView.text)
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
    

}
