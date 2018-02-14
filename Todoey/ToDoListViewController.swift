//
//  ViewController.swift
//  Todoey
//
//  Created by Christopher Tropiano on 2/12/18.
//  Copyright © 2018 Christopher Tropiano. All rights reserved.
// We use index path in order to show currently selected cell

import UIKit

//change view controller inherits from because we changed the view controller

class ToDoListViewController: UITableViewController {
    
        let itemArray = ["Find Mike", "Buy Eggos", "Destroy Demogorgon"]

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath )
       
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
//Mark- Table View Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        
        
        //puts a checkmark after item is selected: If deselected the checkmark is removed
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark
        }
        

      
        
        //after row is selected grey fades
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
 



