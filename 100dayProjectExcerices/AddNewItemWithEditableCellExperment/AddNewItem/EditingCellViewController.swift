//
//  EditingCellViewController.swift
//  AddNewItem
//
//  Created by Boshi Li on 2016/10/30.
//  Copyright © 2016年 iOSTraingCamp_Boshi Li. All rights reserved.
//

import UIKit

class EditingCellViewController: UIViewController {

    
    var indexPathPointer: IndexPath?
    var sendingContent : [cellDataPort]? //nothing
    var delegate:sendDataDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var enterWorkTextField: UITextField!{
        didSet{
            self.enterWorkTextField.resignFirstResponder()
            if let pointer = indexPathPointer?.row{
                self.enterWorkTextField.text = sendingContent?[pointer].workData
            }
        }
    }

    @IBAction func saveBarButton(_ sender: UIBarButtonItem) {
        if delegate != nil{
            if let data = enterWorkTextField.text {
                let cellDataPortInstance = cellDataPort(workData: data, workDate: Date(), workDetail: "ssssss")
                delegate?.userEnteredData(workData: cellDataPortInstance, sender: self)
                _ = self.navigationController?.popToRootViewController(animated: true)
            }
        }
    }
}
