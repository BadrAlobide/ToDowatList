//
//  ViewController.swift
//  ToDowatList
//
//  Created by Mac on 23/08/1439 AH.
//  Copyright © 1439 Badr Reshed. All rights reserved.
//

import UIKit

class TodoListViewContoller: UITableViewController {
  // 11
    let listArray = ["go home at 100:00PM","Sleep for 7 hours","Go to the Bank at 9:00AM to cash the check"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - tableView dataSourse
    /***************************************************************/
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = listArray[indexPath.row]
        return cell
    }

    // MARK: - TableView Dalgte Method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(listArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
}

