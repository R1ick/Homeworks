//
//  StorageManager.swift
//  ToDoList
//
//  Created by Ярослав Антонович on 08.03.2022.
//
import UIKit

enum TaskPriority: String {
    case low = "Low"
    case medium = "Medium"
    case hight = "Hight"
}

class Storage {
    private init() {}
    
    static let shared = Storage()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveContext() {
        do {
            try context.save()
        } catch {
            print(#line, error.localizedDescription)
        }
    }
}
