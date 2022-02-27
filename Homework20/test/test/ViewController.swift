//
//  ViewController.swift
//  test
//
//  Created by Ярослав Антонович on 25.02.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var viewStack: UIStackView!
    @IBOutlet weak var makerStack: UIStackView!
    @IBOutlet weak var modelStack: UIStackView!
    @IBOutlet weak var colorStack: UIStackView!
    @IBOutlet weak var someStack: UIStackView!
    
    var some: String? = nil
    var some1: String? = "1"
    var some2: String? = "2"
    var some3: String? = "3"
    
    @IBAction func deleteLast() {
        someStack.removeFromSuperview()
//        var stacks = mainStackView.arrangedSubviews
//        if some == nil {
//            stacks[0].removeFromSuperview()
//        }
    }
}

