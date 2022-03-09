//
//  CategoryTVC.swift
//  ToDoList
//
//  Created by Ярослав Антонович on 08.03.2022.
//

import UIKit
import CoreData

class CategoryTVC: UITableViewController {
    
    var categories = [CategoryModel]()
    let storageManager = Storage.shared
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dest = segue.destination as? ToDoListTVC,
              let category = sender as? CategoryModel
        else { return }
        dest.selectedCategory = category
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row].category

        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let index = categories[indexPath.row].id
            let request: NSFetchRequest<CategoryModel> = CategoryModel.fetchRequest()
            request.predicate = NSPredicate(format: "id MATCHES %@", index!)
            if let categories = try? context.fetch(request) {
                for category in categories {
                    context.delete(category)
                }
                self.categories.remove(at: indexPath.row)
                self.storageManager.saveContext() // после удаления сохраняем текущий контекст
                tableView.deleteRows(at: [indexPath], with: .bottom)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toList", sender: categories[indexPath.row])
    }
   
    @IBAction func addCategoryAction(_ sender: UIBarButtonItem) {
        showAlert()
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Add new category", message: "", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Category"
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            if let textField = alert.textFields?.first, let text = textField.text, text != "",
               let context = self?.context {
                let newCategory = CategoryModel(context: context)
                newCategory.category = text
                self?.categories.append(newCategory)
                newCategory.id = String((self?.categories.count)! - 1)
                self?.storageManager.saveContext()
                self?.tableView.insertRows(at: [IndexPath(row: (self?.categories.count)! - 1, section: 0)], with: .right)
            }
        }
        alert.addAction(cancel)
        alert.addAction(addAction)
        self.present(alert, animated: true)
    }
    
    // MARK: - Core Data
    private func loadCategories(with request: NSFetchRequest<CategoryModel> = CategoryModel.fetchRequest()) {
        do {
            categories = try context.fetch(request)
        } catch {
            print(#file, #line, error.localizedDescription)
        }
        tableView.reloadData()
    }
}
