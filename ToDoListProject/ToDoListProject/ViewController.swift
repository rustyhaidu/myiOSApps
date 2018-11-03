//
//  ViewController.swift
//  ToDoListProject
//
//  Created by Claudiu Haidu on 13/10/2018.
//  Copyright © 2018 Claudiu Haidu. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var taskTableView: UITableView!
    
    var realm: Realm!
    var taskArray: Results<Task>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.realm = try! Realm()
        self.taskArray = realm.objects(Task.self)
    }
    
    func saveAction(name: String) {
        let task = Task(id: UUID().uuidString, name: name, isFinished: false)
        try! self.realm.write {
            self.realm.add(task)
        }
        taskTableView.reloadData()
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Add item", message: "", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let okAction = UIAlertAction(title: "Add", style: .default) { (action) in
            let textField = alertController.textFields![0] as UITextField
            let itemName = textField.text
            self.saveAction(name: itemName!)
        }
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        alertController.addTextField(configurationHandler: {(textField : UITextField!) -> Void in
            textField.placeholder = "Task name"
        })
        self.present(alertController, animated: true)
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! UITableViewCell
        let task = taskArray[indexPath.row]
        cell.textLabel?.text = task.name
        return cell
    }
}
