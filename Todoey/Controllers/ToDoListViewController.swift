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
    
    var itemArray = [Item]()

    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Find Mike"
        itemArray.append(newItem)
        
        let newItem3 = Item()
        newItem3.title = "Find Mike"
        itemArray.append(newItem)
        if let items = defaults.array(forKey: "ToDoListArray") as? [String] {
            itemArray = items
    }
       
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath )
        
        let item = itemArray[indexPath.row]
       
        cell.textLabel?.text = item.title
        
        //Ternary Operators
        cell.accessoryType = item.done == true ? .checkmark : .none
        
       
        return cell
    }
    
//Mark- Table View Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
       itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        //forces reload data
        tableView.reloadData()
        
        //after row is selected grey fades
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //ADD NEW ITEM:
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        //creating alert and action
        let alert = UIAlertController (title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction (title: "Add Item", style: .default) { (action) in
            
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            
            //How to set defaults for data persistence: Make sure to put key
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
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
 



