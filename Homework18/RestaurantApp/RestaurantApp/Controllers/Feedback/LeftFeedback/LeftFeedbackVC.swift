//
//  LeftFeedbackVC.swift
//  RestaurantApp
//
//  Created by Ярослав Антонович on 16.02.2022.
//

import UIKit
import CoreLocation

class LeftFeedbackVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        hideKeyboardWhenTappedAround()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton! {
        didSet {
            saveButton.isEnabled = false
        }
    }
    
    var index = 0
    var images: [UIImage]? = []
    var completionHandler: ((Bool) -> ())?
    
    private var mark = 1.0
}

extension LeftFeedbackVC {
    @IBAction func chooseRating(_ sender: UISegmentedControl) {
        mark += Double(sender.selectedSegmentIndex)
    }
    
    @IBAction func saveTapped() {
        StorageManager.shared.meals[index].feedbacks.append(Feedback(text: textView.text, mark: mark, images: images))
        dismiss(animated: true) {
            guard let completionHandler = self.completionHandler else { return }
            completionHandler(true)
        }
    }
        
    func showAlert() {
        let alert = UIAlertController(title: "Warning", message: "Choose action", preferredStyle: .alert)
        let cameraAction = UIAlertAction(title: "Make a photo", style: .default) { [unowned self] _ in
            CameraAccessManager.shared.checkPermission()
            if CameraAccessManager.shared.result {
                self.chooseImagePickerAction(source: .camera)
            } else {
                UIApplication.shared.open(URL(string: "App-prefs:root=General")!)
            }
        }
        let libraryAction = UIAlertAction(title: "Open the library", style: .default) { [unowned self] _ in
            if LibraryAccessManager.shared.checkPhotoLibraryPermission() {
                self.chooseImagePickerAction(source: .photoLibrary)
            } else {
                UIApplication.shared.open(URL(string: "App-prefs:root=General")!)
            }
        }
        alert.addAction(cameraAction)
        alert.addAction(libraryAction)
        self.present(alert, animated: true)
    }
    
    private func setupView() {
        textView.delegate = self
        [textView.layer, saveButton.layer, collectionView.layer].forEach { $0?.cornerRadius = 15 }
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
