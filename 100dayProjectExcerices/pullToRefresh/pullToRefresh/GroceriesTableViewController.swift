//
//  GroceriesTableViewController.swift
//  pullToRefresh
//
//  Created by Boshi Li on 2016/9/25.
//  Copyright © 2016年 iOSTraingCamp_Boshi Li. All rights reserved.
//

import UIKit

class GroceriesTableViewController: UITableViewController {


    
    // MARK: Functions
    func refreshData () {
        model.data = model.cloudData
        tableView.reloadData()
        refreshControl?.endRefreshing()
    }
    
    // MARK: Refresh Control
    let pullToRefreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = self.editButtonItem
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: "addItem")
        self.refreshControl = pullToRefreshControl
        refreshControl?.addTarget(self, action: #selector(GroceriesTableViewController.refreshData), for: UIControlEvents.valueChanged)
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groceriesCell", for: indexPath)
        
        cell.textLabel!.text = model.data[indexPath.row]

        return cell
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            model.data.remove(at: indexPath.row)
            model.cloudData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = model.cloudData[sourceIndexPath.row]
        model.cloudData.remove(at: sourceIndexPath.row)
        model.cloudData.insert(movedObject, at: destinationIndexPath.row)
        //print( "\(sourceIndexPath.row) => \(destinationIndexPath.row) \(model.cloudData)")
        // To check for correctness enable: self.tableView.reloadData()
    }
    

    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
