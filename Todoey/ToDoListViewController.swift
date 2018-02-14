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
    
    var itemArray = ["Find Mike", "Buy Eggos", "Destroy Demogorgon"]

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
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        //after row is selected grey fades
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //ADD NEW ITEM:
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        //creating alert and action
        let alert = UIAlertController (title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction (title: "Add Item", style: .default) { (action) in
            self.itemArray.append(textField.text!)
            //you have to do this in order to reload all data and show 
            self.tableView.reloadData()

        }
    
        //adding action to our alert
        alert.addAction(action)
        
        
        //adding textfield to our alert
        alert.addTextField {(alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
      
        
        //actually presents the alert to the user
        present(alert, animated: true, completion: nil)
    }
    
}
 



