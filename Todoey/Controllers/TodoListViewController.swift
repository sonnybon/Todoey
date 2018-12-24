//
//  ViewController.swift
//  Todoey
//
//  Created by Sonny Bonyadi on 2018-11-28.
//  Copyright © 2018 Sonny Bonyadi. All rights reserved.
//

import UIKit


class TodoListViewController: UITableViewController {
  
    
     var itemArray = [Item]()
     let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let newItem = Item()
        newItem.title = "find milk"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "buy bread"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "pay hydro"
        itemArray.append(newItem3)
    
        
        
        
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items
        }
    
    }
    
    //MARK - Tableview Datasource Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let item = itemArray[indexPath.row]
        
         let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
    
        //let cell = UITableViewCell(style: .default, reuseIdentifier: "ToDoItemCell")
        
        cell.textLabel?.text = item.title
        
        // Ternary Operator ==>
        // value = condition ? valueIfTrue : ValueIfFalse
        
        cell.accessoryType = item.done == true ? .checkmark : .none
        
        //same as:
//        if item.done == true {
//            cell.accessoryType = .checkmark
//        } else {
//
//            cell.accessoryType = .none
//        }
        
        return cell
    
    }
    //MARK - Tableiew Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        print(selectedCell.textLabel!.text!)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
       
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
     
        
//        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        }
//        else {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//
//}
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
         var textField = UITextField()
        
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // What will happen once the user clicks the Add Item button on our UIAlert
            
            
            
            let newItem = Item()
            newItem.title = textField.text!
            
            
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
            
          
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
}

