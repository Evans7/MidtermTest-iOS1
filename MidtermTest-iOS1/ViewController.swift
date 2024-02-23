//
//  ViewController.swift
//  MidtermTest-iOS1
//
//  Created by Rania Arbash on 2023-02-23.
//

import UIKit

class ViewController: UIViewController{
  
    @IBOutlet weak var todoText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }


    @IBAction func saveNewToDo(_ sender: Any) {
       
        if let todo_text = todoText.text {
            if  (!todo_text.isEmpty && todo_text.count > 0) {
                let newToDo = ToDo(t: todo_text)
               
                todoText.text = ""
            }
        }
    
    }
    
    
    
    
}

