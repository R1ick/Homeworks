//
//  TasksTVC.swift
//  ToDoRealm
//
//  Created by Ярослав Антонович on 13.03.2022.
//

import UIKit
import RealmSwift

final class TasksTVC: BaseTVC {
    
    var parentList = TaskList()
    var tasks = List<Task>()
    private let priorities: [TaskType] = [.hight, .medium, .low]
    
    private var hightTasks = [Task]()
    private var mediumTasks = [Task]()
    private var lowTasks = [Task]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        parentList.tasks = tasks
        updatePriorities()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return priorities.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return priorities[section].rawValue
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let taskType = priorities[section]
        let current = tasks[taskType]
        return current.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        let taskType = priorities[indexPath.section]
        let task = tasks[taskType][indexPath.row]
        cell.textLabel?.text = task.name
        cell.detailTextLabel?.text = task.note
        cell.accessoryType = task.isComplete ? .checkmark : .none

        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let taskType = priorities[indexPath.section]
        let task = tasks[taskType][indexPath.row]
        try! realm.write { task.isComplete.toggle() }
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let taskType = priorities[indexPath.section]
        let task = tasks[taskType][indexPath.row]
        let delete = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            try! realm.write {
                realm.delete(task)
                self.tableView.deleteRows(at: [indexPath], with: .right)
            }
        }
        let edit = UIContextualAction(style: .normal, title: "Edit") { _, _, _ in
            self.editAlert(task: task) {
                self.updatePriorities()
                self.tableView.reloadData()
            }
        }
        let note = UIContextualAction(style: .normal, title: "Note") { _, _, _ in
            self.noteAlert(task: task) {
                self.tableView.reloadRows(at: [indexPath], with: .fade)
            }
        }
        edit.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        note.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        
        let configuration = UISwipeActionsConfiguration(actions: [delete, edit, note])
        return configuration
    }
}

// MARK: - Private functions
extension TasksTVC {
    private func setupNavBar() {
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction))
        self.navigationItem.setRightBarButtonItems([add, editButtonItem], animated: true)
    }
    
    @objc private func addAction() {
        let newTask = Task()
        addAlert(with: tableView, and: newTask) { result in
            if result {
                try! realm.write{
                    self.parentList.tasks.append(newTask)
                    self.tableView.insertRows(at: [IndexPath(row: self.lowTasks.count, section: 2)], with: .left)
                }
                switch newTask.priority {
                case "Hight":
                    self.hightTasks.append(newTask)
                case "Medium":
                    self.mediumTasks.append(newTask)
                case "Low":
                    self.lowTasks.append(newTask)
                default: break
                }
            }
        }
    }
    
    private func editAlert(task: Task, completion: @escaping (() -> ())) {
        let alert = UIAlertController(title: task.name, message: "Select priority", preferredStyle: .alert)
        let hight = UIAlertAction(title: "Hight", style: .default) { _ in
            try! realm.write { task.priority = "Hight" }
            completion()
        }
        let medium = UIAlertAction(title: "Medium", style: .default) { _ in
            try! realm.write { task.priority = "Medium" }
            completion()
        }
        let low = UIAlertAction(title: "Low", style: .default) { _ in
            try! realm.write { task.priority = "Low" }
            completion()
        }
        alert.addAction(hight)
        alert.addAction(medium)
        alert.addAction(low)
        present(alert, animated: true)
    }
    
    private func noteAlert(task: Task, completion: @escaping (() -> ())) {
        let alert = UIAlertController(title: task.name, message: "Enter note (optional)", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Example"
        }
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        let add = UIAlertAction(title: "Add", style: .default) { _ in
            guard let text = alert.textFields?.last?.text, !text.isEmpty else { return }
            try! realm.write { task.note = text }
            completion()
        }
        alert.addAction(cancel)
        alert.addAction(add)
        present(alert, animated: true)
    }
    
    private func updatePriorities() {
        hightTasks = tasks[.hight]
        mediumTasks = tasks[.medium]
        lowTasks = tasks[.low]
    }
}
