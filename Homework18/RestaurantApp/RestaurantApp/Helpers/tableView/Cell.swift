//
//  CellManager.swift
//  RestaurantApp
//
//  Created by Ярослав Антонович on 16.02.2022.
//

import UIKit

class Cell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        [firstPic.layer, secondPic.layer, thirdPic.layer].forEach { $0?.cornerRadius = 10 }
    }
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var firstPic: UIImageView!
    @IBOutlet weak var secondPic: UIImageView!
    @IBOutlet weak var thirdPic: UIImageView!
    @IBOutlet weak var imagesStack: UIStackView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
}
