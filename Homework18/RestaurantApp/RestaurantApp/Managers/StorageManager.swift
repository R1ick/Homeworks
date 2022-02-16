//
//  MealsStorage.swift
//  RestaurantApp
//
//  Created by Ярослав Антонович on 16.02.2022.
//

import UIKit

struct StorageManager {
    private init() {}
    
    static var shared = StorageManager()
    
    var meals = [
        Meal(name: "Hot-dog", price: 5, image: UIImage(named: "hotDog"), feedbacks: []),
        Meal(name: "Burger", price: 5, image: UIImage(named: "burger"), feedbacks: []),
        Meal(name: "Coca-Cola", price: 2, image: UIImage(named: "cola"), feedbacks: [])
    ]
}
