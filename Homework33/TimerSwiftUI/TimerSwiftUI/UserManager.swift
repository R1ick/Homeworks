//
//  UserManager.swift
//  TimerSwiftUI
//
//  Created by Martynov Evgeny on 5.04.22.
//

import Combine

class UserManager: ObservableObject {
    @Published var isRegister = false
    // A type that publishes a property marked with an attribute.
    // Тип, который публикует свойство, помеченное атрибутом.
    // Публикация свойства с атрибутом @Published создает издателя этого типа.
    // Вы получаете доступ к издателю с помощью оператора $
    var name = ""
}
