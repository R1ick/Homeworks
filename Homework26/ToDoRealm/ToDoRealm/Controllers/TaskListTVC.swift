//
//  ViewController.swift
//  ToDoRealm
//
//  Created by Ярослав Антонович on 12.03.2022.
//

import UIKit
import RealmSwift

final class TaskListTVC: BaseTVC {
    
    private var taskLists: Results<TaskList>!
    private let storage = Storage.shared
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        print(realm.configuration.fileURL)
        taskLists = realm.objects(TaskList.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dest = segue.destination as? TasksTVC else { return }
        let index = sender as! Int
        let list = taskLists[index]
        dest.tasks = list.tasks
        dest.parentList = list
        dest.navigationItem.title = list.listName
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskLists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
        let taskList = taskLists[indexPath.row]
        cell.textLabel?.text = taskList.listName
        cell.detailTextLabel?.text = String(taskList.tasks.count)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toTasks", sender: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let taskList = taskLists[indexPath.row]
        if editingStyle == .delete {
            storage.deleteObject(taskList)
            tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .top)
        }
    }
    
    @IBAction func addAction(_ sender: UIBarButtonItem) {
        let newList = TaskList()
        addAlert(with: tableView, and: newList) { result in
            if result {
                self.tableView.insertRows(at: [IndexPath(row: self.taskLists.count - 1, section: 0)], with: .middle)
            }
        }
    }
    
    @IBAction func sortAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            taskLists = taskLists.sorted(byKeyPath: "listName")
            tableView.reloadData()
        case 1:
            taskLists = taskLists.sorted(byKeyPath: "date")
            tableView.reloadData()
        default: break
        }
    }
}

