//
//  GroceriesTableViewController.swift
//  BasicTableView2
//
//  Created by Boshi Li on 2016/9/24.
//  Copyright © 2016年 iOSTraingCamp_Boshi Li. All rights reserved.
//

import UIKit

class GroceriesTableViewController: UITableViewController {

    // MARK: Variables
    var data = ["milk", "apples", "hams", "eggs", "pancakes", "cereal"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groceriesCell", for: indexPath)
        
        cell.textLabel?.text = data[indexPath.row]

        // Configure the cell...

        return cell
    }
 

    }
