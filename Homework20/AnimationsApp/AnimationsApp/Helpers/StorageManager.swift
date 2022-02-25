//
//  StorageManager.swift
//  AnimationsApp
//
//  Created by Ярослав Антонович on 25.02.2022.
//

import UIKit

class StorageManager {
    private init() {}
    
    static let shared = StorageManager()
    
    var force = ""
    var duration = ""
    var delay = ""
    var curve = ""
    var accentColor: UIColor = .white
}
