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
    var listArray = ["go home at 100:00PM","Sleep for 7 hours","Go to the Bank at 9:00AM to cash the check"]
    let defualte = UserDefaults.standard
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = defualte.array(forKey: "added new item") as? [String] {
            listArray = item
        }
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
    // MARK: - ADD now item
    
    @IBAction func addNowItem(_ sender: UIBarButtonItem) {
        
        var textFiled = UITextField()
        
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "add", style: .default) { (action) in
//            print("success")
            self.listArray.append(textFiled.text!)
            self.defualte.setValue(self.listArray, forKey: "added new item")
            self.tableView.reloadData()
            print(textFiled.text)
        }
        alert.addTextField { (alertTextfiled) in
            alertTextfiled.placeholder = "creat new item"
            textFiled = alertTextfiled
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

