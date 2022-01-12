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
    @IBOutlet weak var breakButton: UIButton! {
        didSet {
            breakButton.layer.isHidden = true
            breakButton.layer.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1).cgColor
            breakButton.tintColor = .white
        }
    }
    
    @IBOutlet weak var superView: UIView! {
        didSet {
            superView.layer.cornerRadius = 20
        }
    }
    
    enum TraffickLts {
        case stop
        case ready
        case go
        case readyStop
    }
    
    @IBAction func buttonTapped() {
        button.isHidden = true
        breakButton.isHidden = false
        breakButton.isEnabled = true
        turnOn(trafficLight: .stop)
    }
    
    @IBAction func breakButtonTapped(_ sender: UIButton) {
        button.isHidden = false
        breakButton.isHidden = true
        breakButton.isEnabled = false
    }
    
    
    private func turnOn(trafficLight: TraffickLts) {
        if breakButton.isEnabled {
            switch trafficLight {
            case .stop:
                UIView.animate(withDuration: 0.3, delay: 1, options: .curveLinear, animations: {
                    self.orangeSignal.layer.opacity = 0.2
                    self.redSignal.layer.opacity = 1
                }, completion: { _ in self.turnOn(trafficLight: .ready) })
            case .ready:
                UIView.animate(withDuration: 0.3, delay: 1, options: .curveLinear, animations: {
                    self.orangeSignal.layer.opacity = 1
                }, completion: { _ in self.turnOn(trafficLight: .go) })
            case .go:
                UIView.animate(withDuration: 0.3, delay: 1, options: .curveLinear, animations: {
                    self.redSignal.layer.opacity = 0.2
                    self.orangeSignal.layer.opacity = 0.2
                    self.greenSignal.layer.opacity = 1
                }, completion: { _ in self.turnOn(trafficLight: .readyStop) } )
            case .readyStop:
                UIView.animate(withDuration: 0.3, delay: 1, options: .curveLinear, animations: {
                    self.greenSignal.layer.opacity = 0.2
                    self.orangeSignal.layer.opacity = 1
                }, completion: { _ in self.turnOn(trafficLight: .stop) })
            }
        }
    }
}
