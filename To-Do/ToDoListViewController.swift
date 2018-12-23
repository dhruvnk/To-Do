//
//  ViewController.swift
//  To-Do
//
//  Created by Dhruv Nandakumar on 12/22/18.
//  Copyright © 2018 Dhruv Nandakumar. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var itemArray: [String] = []
    let userDefault = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = userDefault.array(forKey: "ToDoListArray") as? [String] {
            itemArray = item
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK: - Table View Data Source Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    //MARK: - Table view delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType != .checkmark {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
        } else {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        
        
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
    //MARK: - Add new items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        
        let alert = UIAlertController(title: "Add Item", message: "Add a new item to your list.", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        let NewItemAction = UIAlertAction(title: "Add Item", style: .default) {
            (action) in
            
            if textField.text != nil {
                self.itemArray.append(textField.text!)
                self.userDefault.set(self.itemArray, forKey: "ToDoListArray")
            }
            
            self.tableView.reloadData()
            
        }
        
        alert.addAction(NewItemAction)
        alert.addAction(cancelAction)
        
        alert.addTextField {
            (alertTextField) in
            alertTextField.placeholder = "Get groceries...."
            textField = alertTextField
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
}

