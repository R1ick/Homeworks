//
//  TaskList.swift
//  ToDoRealm
//
//  Created by Ярослав Антонович on 12.03.2022.
//

import RealmSwift
import Foundation

class TaskList: Object {
    @objc dynamic var listName = ""
    @objc dynamic var date = Date()
    var tasks = List<Task>()
}
