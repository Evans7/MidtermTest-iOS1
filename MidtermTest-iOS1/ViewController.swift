//
//  ViewController.swift
//  MidtermTest-iOS1
//
//  Created by Rania Arbash on 2023-02-23.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    var allTodos = [ToDo]()
    var newlyAddedIndexPaths = Set<IndexPath>()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return allTodos.count
    }
    @IBOutlet weak var urgentSwitch: UISwitch!
    
    @IBAction func isUrgent(_ sender: Any) {
        
    }
    @IBOutlet weak var todoTable: UITableView!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if(urgentSwitch.isOn)
        {
        
            if(newlyAddedIndexPaths.contains(indexPath) )          {  cell.textLabel?.text = allTodos[indexPath.row].task
                cell.textLabel?.textColor = UIColor.red
                newlyAddedIndexPaths.remove(indexPath)
                
            }
        }
        else{
            
            if(newlyAddedIndexPaths.contains(indexPath))
            {
                cell.textLabel?.text = allTodos[indexPath.row].task
                cell.textLabel?.textColor =
                UIColor.green
                newlyAddedIndexPaths.remove(indexPath)
            }
        }
        
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return 1
            
        }
    
    @IBOutlet weak var todoText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        urgentSwitch.isOn = false;

    }


    @IBAction func saveNewToDo(_ sender: Any) {
       
        if let todo_text = todoText.text {
            if  (!todo_text.isEmpty && todo_text.count > 0) {
                let newToDo = ToDo(t: todo_text)
                let newIndexPath = IndexPath(row: allTodos.count, section: 0)
                

                allTodos.append(newToDo)
                newlyAddedIndexPaths.insert(newIndexPath)
                
                todoTable.reloadData()
                todoText.text = ""
            }
        }
    
    }
    
    
    
    
}

