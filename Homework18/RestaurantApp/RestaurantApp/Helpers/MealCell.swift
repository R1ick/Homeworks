//
//  MealCell.swift
//  RestaurantApp
//
//  Created by Ярослав Антонович on 16.02.2022.
//

import UIKit

class MealCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
   
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mealPrice: UILabel!
    @IBOutlet weak var mealRating: UILabel!
    
}
