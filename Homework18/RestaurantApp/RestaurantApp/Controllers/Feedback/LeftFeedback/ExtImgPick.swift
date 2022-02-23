//
//  ExtImgPick.swift
//  RestaurantApp
//
//  Created by Ярослав Антонович on 21.02.2022.
//

import UIKit

extension LeftFeedbackVC: UINavigationControllerDelegate {
    
}

extension LeftFeedbackVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showAlert()
    }
}

extension LeftFeedbackVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collCell", for: indexPath) as! ImageCell
        cell.layer.cornerRadius = 15
        cell.imageView.contentMode = .scaleAspectFit
        cell.imageView.clipsToBounds = true
        
        return cell
    }
}

extension LeftFeedbackVC: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else { return }
        let cell = collectionView.cellForItem(at: (collectionView.indexPathsForSelectedItems?.first)!) as! ImageCell
        cell.imageView.image = image
        images?.append(image)
        dismiss(animated: true)
    }
        
    func chooseImagePickerAction(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
}

