//
//  TodoListViewController.swift
//  Todoey
//
//  Created by André Grillo on 19/12/17.
//  Copyright © 2017 André Grillo. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    var itemArray = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(dataFilePath)
        
        loadItens()
        
    }

    //MARK: TableView Data Source Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].title
        
        //Ternary Operator
        //value = condition ? valueIfTrue : valueIfFalse
        
        //A linha abaixo substitui as 5 outras linhas abaixo
        //cell.accessoryType = itemArray[indexPath.row].done == true ? .checkmark : .none
        cell.accessoryType = itemArray[indexPath.row].done ? .checkmark : .none
//        if itemArray[indexPath.row].done{
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
        
        return cell
    }
    
    //MARK: TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        saveItens()
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    
    }

    //MARK: Add new Items Section
    @IBAction func addBtnPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen after the user clicks the add item on our uialert
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem) //Se for nil coloca o valor default na string
            
            //self.itemArray.append(textField.text ?? "New Item") //Se for nil coloca o valor default na string

            self.saveItens()

        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
            
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func saveItens(){
        
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(itemArray)
            try data.write(to: dataFilePath!)
        } catch {
            print("Error encoding Item Array: \(error)")
        }
        
        tableView.reloadData()
        
    }
    
    func loadItens(){
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do{
                itemArray = try decoder.decode([Item].self, from: data)
            } catch {
                print("Error decoding item array: \(error)")
            }
        }
        
    }
}

