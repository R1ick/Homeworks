//
//  ViewController.swift
//  RestaurantApp
//
//  Created by Ярослав Антонович on 16.02.2022.
//

import UIKit

class MealDetailVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toWriteFeedback" {
            guard let destination = segue.destination as? LeftFeedbackVC else { return }
            destination.index = mealIndex!
            destination.completionHandler = { [weak self] result in
                if result == true {
                    self?.navigationController?.popToRootViewController(animated: false)
                }
            }
        }
        if segue.identifier == "toReviews" {
            guard let destination = segue.destination as? FeedbacksTVC else { return }
            destination.index = mealIndex!
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var viewFeedbackButton: UIButton!
    
    var mealIndex: Int?
    var completionHandler: ((Bool) -> ())?
    
}

extension MealDetailVC {
    @IBAction func viewFeedback() {
        performSegue(withIdentifier: "toReviews", sender: nil)
    }
}

extension MealDetailVC {
    private func setupScreen() {
        guard let mealIndex = mealIndex else { return }
        let storage = StorageManager.shared.meals[mealIndex]
        self.imageView.image = storage.image
        self.nameLabel.text = storage.name
        self.ratingLabel.text = storage.ratingBar
        self.priceLabel.text = String(storage.price) + " руб"
        if storage.rating == nil {
            viewFeedbackButton.isEnabled = false
            ratingLabel.text = "There are no feedback's yet"
        } else {
            viewFeedbackButton.isEnabled = true
            ratingLabel.text = StorageManager.shared.meals[mealIndex].ratingBar
        }
    }
}

