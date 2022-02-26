//
//  Meal.swift
//  RestaurantApp
//
//  Created by Ярослав Антонович on 16.02.2022.
//

import UIKit

struct Meal {
        
    var name: String = ""
    var price: Double = 0.0
    var image: UIImage? = nil

    var feedbacks = [Feedback]()
    
    var ratingBar: String {
        guard let rating = rating else { return "There are no reviews yet" }
        return String(repeating: "⭐️", count: Int(round(rating)))
    }
    
    var rating: Double? {
        if feedbacks.isEmpty {
            return nil
        } else {
            var avarageMark = 0.0
            for feedback in feedbacks {
                avarageMark += feedback.mark
            }
           return avarageMark / Double(feedbacks.count)
        }
    }
}

struct Feedback {
    private let date = Date()
    let text: String
    let mark: Double
    
    var images: [UIImage]?
    
    var currentDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.YYYY HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        return dateFormatter.string(from: date)
    }
    
    var rating: String {
        String(repeating: "⭐️", count: Int(round(mark)))
    }
}

