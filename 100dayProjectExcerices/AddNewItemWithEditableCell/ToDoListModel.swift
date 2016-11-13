//
//  ToDoListModel.swift
//  AddNewItem
//
//  Created by Boshi Li on 2016/10/16.
//  Copyright © 2016年 iOSTraingCamp_Boshi Li. All rights reserved.
//

import Foundation
import UIKit

//var toDoListModel = ToDoListModel()
//let defaults = UserDefaults.standard

protocol sendDataDelegate {
    func userEnteredData(workData : cellDataPort, sender: UIViewController)
}

protocol upDateCellUI {
    func upDateUI (work : String, date : String)
}

protocol editButtonDidTap {
    func editAction (buttonSender : UIButton, whith Cell: UITableViewCell)
}

// A protocol that the TableViewCell uses to inform its delegate of state change
protocol TableViewCellPanGesturesDelegate {
    func toDoCellDidPanGestures(cell: ToDoTableViewCell, didPan recognizer: UIPanGestureRecognizer, gesture methods: gestureMethods)
}

protocol TableViewCellTapGesturesDelegate {
    func toDoCellDidTapGestures(cell: ToDoTableViewCell, didTap recognizer: UITapGestureRecognizer)
}

protocol BlockPanGestureInCell {
    func didScrollInItSuperView(didBlock blockPan: Bool, from sender: UITableViewController)
}

struct Storyboard {
    static let EditWorkSegueIdentifier = "showEditWork"
    static let AddNewWorkSegueIdentifier = "showAddWork"
}

enum gestureMethods {
    case panLeft
    case panRight
    case tapButton
}

@objc(cellDataPort)
class cellDataPort : NSObject, NSCoding{

    var workData: String
    var workDate: Date
    var workDetail : String
    
    
    required init(workData: String, workDate: Date, workDetail : String) {

        self.workData = workData
        self.workDate = workDate
        self.workDetail = workDetail
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let workData = aDecoder.decodeObject(forKey: "workData") as! String
        let workDate = aDecoder.decodeObject(forKey: "naworkDateme") as! Date
        let workDetail = aDecoder.decodeObject(forKey: "workDetail") as! String
        self.init(workData: workData, workDate: workDate, workDetail: workDetail)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(workData, forKey: "workData")
        aCoder.encode(workDate, forKey: "naworkDateme")
        aCoder.encode(workDetail, forKey: "workDetail")
    }

}





