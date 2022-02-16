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
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
}
