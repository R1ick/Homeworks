//
//  BaseViewController.swift
//  RestApplication
//
//  Created by Ярослав Антонович on 02.03.2022.
//

import UIKit

class BaseViewController: UIViewController { 
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showWaring(text: String) {
        let alert = UIAlertController(title: "Error", message: text, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
}
