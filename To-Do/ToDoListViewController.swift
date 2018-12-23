//
//  ViewController.swift
//  To-Do
//
//  Created by Dhruv Nandakumar on 12/22/18.
//  Copyright © 2018 Dhruv Nandakumar. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    let itemArray = ["Go to The Ba", "Find Dinky", "Wuv Dinky"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    
}
