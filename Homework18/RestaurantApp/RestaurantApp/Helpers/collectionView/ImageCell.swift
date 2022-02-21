//
//  ImageCell.swift
//  RestaurantApp
//
//  Created by Ярослав Антонович on 19.02.2022.
//

import UIKit

class ImageCell: UICollectionViewCell {
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = 15
        }
    }
    
    @IBAction func didTapDeleteButton() {
        let photo = imageView.image == UIImage(named: "photo.tv")
        if !photo {
            imageView.image = UIImage(named: "photo.tv")
        }
    }
}
