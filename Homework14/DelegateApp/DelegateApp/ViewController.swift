//
//  ViewController.swift
//  DelegateApp
//
//  Created by Ярослав Антонович on 07.02.2022.
//

import UIKit

class ViewController: UIViewController, ColorDelegate {
    
    func updateColor(color: UIColor) {
        self.view.backgroundColor = color
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTapped() {
        performSegue(withIdentifier: "toSecondVC", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextVC = segue.destination as? DetailColorVC else { return }
        nextVC.delegate = self
    }
    


}

protocol ColorDelegate: AnyObject {
    func updateColor(color: UIColor)
}
