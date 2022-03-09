//
//  ToDoListTVC.swift
//  ToDoList
//
//  Created by Ярослав Антонович on 08.03.2022.
//

import UIKit
import CoreData

class ToDoListTVC: UITableViewController {
    
    var items = [Item]()
    var lowPriorityItems = [Item]()
    var mediumPriorityItems = [Item]()
    var hightPriorityItems = [Item]()
    let priorities: [TaskPriority] = [.hight, .medium, .low]
    let storageManager = Storage.shared
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    var selectedCategory: CategoryModel! {
        didSet {
            self.navigationItem.title = selectedCategory.category
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        loadItems()
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
        let current = items[taskType]
        return current.count //current.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let taskType = priorities[indexPath.section]
        let currentItem = items[taskType][indexPath.row]
        cell.textLabel?.text = currentItem.title
        if currentItem.isCompleted {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let taskType = priorities[indexPath.section]
        items[taskType][indexPath.row].isCompleted.toggle()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let taskType = priorities[indexPath.section]
        let currentTask = items[taskType][indexPath.row]
        if editingStyle == .delete {
            items[taskType].remove(at: indexPath.row)
            switch taskType {
            case .low:
                let removingIndex = lowPriorityItems.removeElement(element: currentTask)
                lowPriorityItems.remove(at: removingIndex)
                context.delete(currentTask)
                storageManager.saveContext()
            case .medium:
                let removingIndex = mediumPriorityItems.removeElement(element: currentTask)
                mediumPriorityItems.remove(at: removingIndex)
                context.delete(currentTask)
                storageManager.saveContext()
            case .hight:
                let removingIndex = hightPriorityItems.removeElement(element: currentTask)
                hightPriorityItems.remove(at: removingIndex)
                context.delete(currentTask)
                storageManager.saveContext()
            }
            tableView.reloadData()
            loadItems()
        }
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var tmp: Item?
        switch sourceIndexPath.section {
        case 0:
            tmp = items[.hight].remove(at: sourceIndexPath.row)
            hightPriorityItems.remove(at: sourceIndexPath.row)
        case 1:
            tmp = items[.medium].remove(at: sourceIndexPath.row)
            mediumPriorityItems.remove(at: sourceIndexPath.row)
        case 2:
            tmp = items[.low].remove(at: sourceIndexPath.row)
            lowPriorityItems.remove(at: sourceIndexPath.row)
        default: break
        }
        switch destinationIndexPath.section {
        case 0:
            tmp!.priority = "Hight"
            hightPriorityItems.append(tmp!)
        case 1:
            tmp!.priority = "Medium"
            mediumPriorityItems.append(tmp!)
        case 2:
            tmp!.priority = "Low"
            lowPriorityItems.append(tmp!)
        default: break
        }
        tableView.reloadData()
        loadItems()
    }
    
    @objc func addAction() {
        showAlert()
    }
}

extension ToDoListTVC {
    private func showAlert() {
        let alert = UIAlertController(title: "Add new task", message: "", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Task"
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            if let textField = alert.textFields?.first, let text = textField.text, text != "",
               let context = self?.context {
                let newItem = Item(context: context)
                newItem.parentCategory = self?.selectedCategory
                newItem.title = text
                newItem.isCompleted = false
                newItem.priority = "Low"
                newItem.id = String((self?.items.count)!)
                self?.items.append(newItem)
                self?.lowPriorityItems.append(newItem)
                self?.items[.low] = self!.items
                self?.storageManager.saveContext()
                self?.tableView.insertRows(at: [IndexPath(row: (self?.lowPriorityItems.count)! - 1, section: 2)], with: .right)
            }
        }
        alert.addAction(cancel)
        alert.addAction(addAction)
        self.present(alert, animated: true)
    }
    
    private func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest(),
                                predicate: NSPredicate? = nil) {
        let mainPredicate = NSPredicate(format: "parentCategory.id MATCHES %@", selectedCategory.id!)
        if let predicate = predicate {
            let predicates = NSCompoundPredicate(andPredicateWithSubpredicates: [mainPredicate, predicate])
            request.predicate = predicates
        } else {
            request.predicate = mainPredicate
        }
        do {
            items = try context.fetch(request)
            lowPriorityItems = items[.low]
            mediumPriorityItems = items[.medium]
            hightPriorityItems = items[.hight]
        } catch {
            print(#file, #line, error.localizedDescription)
        }
        tableView.reloadData()
    }
    
    private func deleteItems() {
        for item in items {
            context.delete(item)
        }
    }
}

extension ToDoListTVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            searchBar.resignFirstResponder()
            loadItems()
            tableView.reloadData()
        } else {
            let request: NSFetchRequest<Item> = Item.fetchRequest()
            let searchPredicate = NSPredicate(format: "title CONTAINS %@", searchText)
            loadItems(with: request, predicate: searchPredicate)
        }
    }
}

extension ToDoListTVC {
    func setupNavBar() {
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction))
        self.navigationItem.setRightBarButtonItems([add, editButtonItem], animated: true)
    }
}
