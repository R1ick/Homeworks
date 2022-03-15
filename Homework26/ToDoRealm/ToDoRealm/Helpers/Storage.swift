//
//  Storage.swift
//  ToDoRealm
//
//  Created by Ярослав Антонович on 12.03.2022.
//

import Foundation
import RealmSwift

let realm = try! Realm()

class Storage {
    
    private init() {}
    
    static let shared = Storage()
    
    func cleanDatabase() {
        do {
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            print(#function, "error")
        }
    }
    
    func saveObject(_ object: Object) {
        try! realm.write {
            if object is Task {
                let task = object as! Task
                realm.add(task)
            } else if object is TaskList {
                let list = object as! TaskList
                realm.add(list)
            }
        }
    }
    
    func deleteObject(_ object: Object) {
        try! realm.write {
            if object is Task {
                let task = object as! Task
                realm.delete(task)
            } else if object is TaskList {
                let list = object as! TaskList
                realm.delete(list) 
            }
        }
    }
}
