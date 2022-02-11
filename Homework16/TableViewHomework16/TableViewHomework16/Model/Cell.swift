//
//  Cell.swift
//  TableViewHomework16
//
//  Created by Ярослав Антонович on 09.02.2022.
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
    
  
    @IBOutlet weak var userPic: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userSurname: UILabel!
    @IBOutlet weak var arrowPic: UIImageView!
    
    
}
