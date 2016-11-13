//
//  toDoListTableViewController.swift
//  AddNewItem
//
//  Created by Boshi Li on 2016/10/16.
//  Copyright © 2016年 iOSTraingCamp_Boshi Li. All rights reserved.
//

import UIKit

class toDoListTableViewController: UITableViewController, sendDataDelegate, editButtonDidTap, TableViewCellPanGesturesDelegate, UIGestureRecognizerDelegate {
    
    // MARK: - Declartions
    
    var defaults = UserDefaults.standard
    var blockPanGestureDelegate: BlockPanGestureInCell?
    
    var blockPanGesture = false
    
    @IBOutlet var toDotableView: UITableView!
    let pullToRefreshControl = UIRefreshControl()
    
    
    var cellData = [cellDataPort]() {
        didSet {
            let theData = NSKeyedArchiver.archivedData(withRootObject: cellData) as NSData
            defaults.setValue(theData, forKey: "cellSaved")
            defaults.synchronize()
        }
    }
    
    private var indexPathPointer = IndexPath()
    
    var originalCenter = CGPoint()
    var deleteOnDragRelease = false
    
    
    
    
    // MARK: - view did load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDotableView.estimatedRowHeight = toDotableView.rowHeight
        //toDotableView.rowHeight = UITableViewAutomaticDimension
        self.refreshControl = pullToRefreshControl
        refreshControl?.addTarget(self, action: #selector(toDoListTableViewController.refresh), for: UIControlEvents.valueChanged)
        
    }
    
    // MARK: - view will appear
    
    override func viewWillAppear(_ animated: Bool) {
        if let decoded = defaults.object(forKey: "cellSaved") as? NSData {
            if let decodedArray = NSKeyedUnarchiver.unarchiveObject(with: decoded as Data) as? [cellDataPort]{
                cellData = decodedArray
            }
        }
        self.toDotableView.reloadData()
    }
    
    // MARK: - Functions
    
    func refresh(){
        //toDoListModel.dataArr = [String]()
        toDotableView.reloadData()
        refreshControl?.endRefreshing()
    }
    
    
    
    // MARK: - Delegates
    
    func userEnteredData(workData : cellDataPort, sender: UIViewController) {
        
        if let ECVC = sender as? EditingCellViewController{
            if let pointer = ECVC.indexPathPointer{
                cellData[pointer.row] = workData
                //toDoListModel.dataArr[pointer] = workData
            }
        } else {
            cellData.append(workData)
        }
    }
    
    func toDoCellDidPanGestures(cell: ToDoTableViewCell, didPan recognizer: UIPanGestureRecognizer, gesture methods: gestureMethods) {
        
        let didGestureLocation = recognizer.location(in: self.tableView)
        if let didGesureIndexPath = self.tableView.indexPathForRow(at: didGestureLocation){
            if let panedCell = self.tableView.cellForRow(at: didGesureIndexPath){
                if methods == .panLeft {
                    cellData.remove(at: didGesureIndexPath.row)
                    tableView.deleteRows(at: [didGesureIndexPath], with: .left)
                    panedCell.textLabel?.backgroundColor = UIColor.white
                }
                if methods == .panRight {
                    panedCell.textLabel?.backgroundColor = UIColor.green
                }
            }
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    
    func editAction (buttonSender : UIButton, whith Cell: UITableViewCell) {
        if let indexPath = self.tableView.indexPathForRow(at: Cell.center) {
            indexPathPointer = indexPath
            performSegue(withIdentifier: Storyboard.EditWorkSegueIdentifier, sender: UITableViewCell.self)
        }
    }
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        blockPanGesture = true
        print(blockPanGesture)
        blockPanGestureDelegate?.didScrollInItSuperView(didBlock: blockPanGesture, from: self)
    }
    
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        blockPanGesture = false
        print(blockPanGesture)
        blockPanGestureDelegate?.didScrollInItSuperView(didBlock: blockPanGesture, from: self)
    }

    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cellData.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = toDotableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ToDoTableViewCell
        
       // cell.cellDataProt = cellData[indexPath.row]
       // cell.tableViewCellPanGesturesDelegate = self
        cell.editButtonDidTapDelegate = self
        
        return cell
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
    }
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.EditWorkSegueIdentifier {
            if let ECVC = segue.destination as? EditingCellViewController{
                ECVC.sendingContent = cellData
                ECVC.indexPathPointer = indexPathPointer
                ECVC.delegate = self
            }
        }
        if segue.identifier == Storyboard.AddNewWorkSegueIdentifier {
            if let ADVC = segue.destination as? AddNewWorkViewController {
                ADVC.delegate = self
            }
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
}
