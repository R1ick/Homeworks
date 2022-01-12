//
//  SecondViewController.swift
//  Homework9
//
//  Created by Ярослав Антонович on 12.01.2022.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBOutlet weak var redSignal: UIView! {
        didSet {
            redSignal.layer.cornerRadius = redSignal.frame.height / 2
            redSignal.layer.opacity = 1
        }
    }
    
    @IBOutlet weak var orangeSignal: UIView! {
        didSet {
            orangeSignal.layer.cornerRadius = orangeSignal.frame.height / 2
            orangeSignal.layer.opacity = 0.2
        }
    }
    @IBOutlet weak var greenSignal: UIView! {
        didSet {
            greenSignal.layer.cornerRadius = greenSignal.frame.height / 2
            greenSignal.layer.opacity = 0.2
        }
    }
    @IBOutlet weak var button: UIButton! {
        didSet {
            button.layer.backgroundColor = UIColor.cyan.cgColor
        }
    }
   
    @IBOutlet weak var superView: UIView! {
        didSet {
            superView.layer.cornerRadius = 20
        }
    }
    
    @IBAction func buttonTapped() {
        button.isEnabled = false
        UIView.animate(withDuration: 0.3, delay: 1, options: .curveLinear, animations: {
            self.orangeSignal.layer.opacity = 1
        }, completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 2, options: .curveLinear, animations: {
                self.redSignal.layer.opacity = 0.2
                self.orangeSignal.layer.opacity = 0.2
                self.greenSignal.layer.opacity = 1
            }, completion: { _ in
                UIView.animate(withDuration: 0.3, delay: 1, options: .curveEaseIn, animations: {
                    self.greenSignal.layer.opacity = 0.2
                }, completion: { _ in
                    self.orangeSignal.layer.opacity = 1
                    UIView.animate(withDuration: 0.3, delay: 1, options: .curveLinear) {
                        self.redSignal.layer.opacity = 1
                        self.orangeSignal.layer.opacity = 0.2
                        self.greenSignal.layer.opacity = 0.2
                        self.button.isEnabled = true
                    } completion: { _ in
                        self.buttonTapped()
                    }
                })
            })
        })
    }
}
