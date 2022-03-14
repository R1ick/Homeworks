//
//  Task.swift
//  ToDoRealm
//
//  Created by Ярослав Антонович on 12.03.2022.
//

import RealmSwift
import Foundation

class Task: Object {
    @objc dynamic var name = ""
    @objc dynamic var note = ""
    @objc dynamic var priority = ""
    @objc dynamic var date = Date()
    @objc dynamic var isComplete = false
}
