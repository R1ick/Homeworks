//
//  DetailUserVC.swift
//  TableViewHomework16
//
//  Created by Ярослав Антонович on 08.02.2022.
//

import UIKit

final class DetailUserVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        customizeFont()
        
        mailLabel.text = userMail
        phoneLabel.text = userPhone
    }
    
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var userMail: String?
    var userPhone: String?
    
    private func customizeFont() {
        self.mailLabel.font = UIFont(name: "American Typewriter", size: 22)
        self.phoneLabel.font = UIFont(name: "American Typewriter", size: 18)
    }

}
