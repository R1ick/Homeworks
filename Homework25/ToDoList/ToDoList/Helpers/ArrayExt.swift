//
//  ArrayExt.swift
//  ToDoList
//
//  Created by Ярослав Антонович on 09.03.2022.
//

import Foundation

extension Array where Element == Item {
    subscript (priority: TaskPriority) -> [Item] {
        get {
            var items = [Item]()
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
