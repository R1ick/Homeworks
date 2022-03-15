//
//  ArrayExt.swift
//  ToDoRealm
//
//  Created by Ярослав Антонович on 14.03.2022.
//

import Foundation
import RealmSwift

extension List where Element == Task {
    subscript (priority: TaskType) -> [Task] {
        get {
            var items = [Task]()
            for element in self {
                switch priority {
                case .low:
                    if element.priority == "Low" {
                        items.append(element)
                    }
                case .medium:
                    if element.priority == "Medium" {
                        items.append(element)
                    }
                case .hight:
                    if element.priority == "Hight" {
                        items.append(element)
                    }
                }
            }
            return items
        }
    }
}

extension Array where Element == Task {
    subscript (priority: TaskType) -> [Task] {
        get {
            return [Task]()
        }
        set {
            self = newValue
        }
    }
}

extension Array where Element: Equatable {
    func removeElement(element: Element) -> Int {
        var removingIndex = 0
        for (index, item) in self.enumerated() {
            if item == element {
                removingIndex = index
            }
        }
        return removingIndex
    }
}
