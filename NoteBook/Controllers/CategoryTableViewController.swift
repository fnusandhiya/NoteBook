//
//  CategoryTableViewController.swift
//  NoteBook
//
//  Created by SandhyAvinash on 4/19/19.
//  Copyright © 2019 fnu sandhiya. All rights reserved.
//

import UIKit
import CoreData

class CategoryTableViewController: UITableViewController {
    
    var categories = [Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

       loadCategories()
    }
    
    //MARK - Tableview datasource methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categories[indexPath.row].name
        
        return cell
    }
    
    //MARK - Tableview delegate methods
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories[indexPath.row]
        }
    }
    
    //MARK - Data manipulation methods
    
    func saveCategories () {
        
        do {
            try context.save()
        } catch {
            print("error saving category \(error)")
        }
        
        tableView.reloadData()
    }
    
    func loadCategories () {
        
        let request : NSFetchRequest<Category> = Category.fetchRequest()
        
        do {
            categories = try context.fetch(request)
        } catch {
            print("error loading categories \(error)")
        }
        
        tableView.reloadData()
        
    }
    
    
    //MARK - Add new categories


    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            let newCategory = Category(context: self.context)
            newCategory.name = textField.text!
            self.categories.append(newCategory)
            
            self.saveCategories()
            
        }
        
        alert.addAction(action)
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Add a new category"
            
        }
        present(alert, animated: true, completion: nil)
    }
    
    
}