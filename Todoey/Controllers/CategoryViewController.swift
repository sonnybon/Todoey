//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Sonny Bonyadi on 2018-12-31.
//  Copyright © 2018 Sonny Bonyadi. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

class CategoryViewController: UITableViewController {

   let realm = try! Realm()
    
    
    var categoryArray : Results<Category>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

     loadCategory()
        
    }
    //MARK: - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray?.count ?? 1
        
        }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = categoryArray?[indexPath.row].name ?? "no Categories added yet"
        
        
        return cell
        
    }
     //MARK: - Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        if let indexpath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categoryArray?[indexpath.row]
        }
    }
    
    
    //MARK: - Data Manipulation Methods
    func save(category : Category){
        
        do {
            
            try realm.write {
                realm.add(category)
            }
            
        } catch {
            print("Error Saving Context \(error)")
        }
        
        self.tableView.reloadData()
        
    }
    
    func loadCategory() {
        categoryArray  = realm.objects(Category.self)
        
        tableView.reloadData()
    }
    
    //MARK: - Add New Categories
        
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    
        var textField = UITextField()
        
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            // What will happen once the user clicks the Add Item button on our UIAlert
        
            let newCategory = Category()
            newCategory.name = textField.text!
            
        
            
            self.save(category: newCategory)
            
        }
        alert.addTextField { (field) in
          textField.placeholder = "Create New Category"
            textField = field
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
        
    
    }
 
    
   
    
    
    
}
