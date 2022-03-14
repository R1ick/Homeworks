//
//  BaseTVC.swift
//  ToDoRealm
//
//  Created by Ярослав Антонович on 13.03.2022.
//

import UIKit
import RealmSwift

class BaseTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func addAlert(with tableView: UITableView, and object: Object, storage: Storage = Storage.shared, completion: @escaping ((Bool) -> ())) {
        let title = object is TaskList ? "New list" : "New task"
        let message = object is TaskList ? "new list" : "new task (default priority is 'low')"
        let alert = UIAlertController(title: title, message: "Please enter the name of the \(message)", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "example"
        }
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        let save = UIAlertAction(title: "Save", style: .default) { _ in
            guard let text = alert.textFields?.first?.text, !text.isEmpty else { return }
            if object is TaskList {
                let object = object as! TaskList
                object.listName = text
            } else {
                let object = object as! Task
                object.name = text
                object.priority = "Low"
            }
            storage.saveObject(object)
            completion(true)
        }
        alert.addAction(cancel)
        alert.addAction(save)
        present(alert, animated: true)
    }
}
