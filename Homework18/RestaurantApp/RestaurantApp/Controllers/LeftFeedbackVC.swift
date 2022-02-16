//
//  LeftFeedbackVC.swift
//  RestaurantApp
//
//  Created by Ярослав Антонович on 16.02.2022.
//

import UIKit

class LeftFeedbackVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton! {
        didSet {
            saveButton.isEnabled = false
        }
    }
    
    var index = 0
    var completionHandler: ((Bool) -> ())?
    
    private var mark = 1.0
}

extension LeftFeedbackVC {
    @IBAction func chooseRating(_ sender: UISegmentedControl) {
        mark += Double(sender.selectedSegmentIndex)
    }
    
    @IBAction func saveTapped() {
        StorageManager.shared.meals[index].feedbacks.append(Feedback(text: textView.text, mark: mark))
        dismiss(animated: true) {
            guard let completionHandler = self.completionHandler else { return }
            completionHandler(true)
        }
    }
    
    private func setupView() {
        textView.delegate = self
        [textView.layer, saveButton.layer].forEach { $0?.cornerRadius = 15 }
    }
}

extension LeftFeedbackVC: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.count < 20 {
            errorLabel.isHidden = false
            saveButton.isEnabled = false
        } else {
            errorLabel.isHidden = true
            saveButton.isEnabled = true
        }
    }
}
