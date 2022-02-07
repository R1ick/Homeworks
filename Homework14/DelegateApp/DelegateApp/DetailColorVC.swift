//
//  DetailColorVC.swift
//  DelegateApp
//
//  Created by Ярослав Антонович on 07.02.2022.
//

import UIKit

class DetailColorVC: UIViewController {
    
    weak var delegate: ColorDelegate?
    private var endColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        blueTextField.text = "0.0"
        redTextField.text = "0.0"
        greenTextField.text = "0.0"
        redSlider.value = 0
        greenSlider.value = 0
        blueSlider.value = 0
        opacitySlider.value = 100
    }
    
    private func getColor() -> UIColor {
        let redColor = CGFloat(redSlider.value)
        let blueColor = CGFloat(blueSlider.value)
        let greenColor = CGFloat(greenSlider.value)
        let alpha = CGFloat(opacitySlider.value)
        
        let resultColor = UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: alpha)
        return resultColor
    }
    
    private func changeViewColor() {
        self.endColorView.backgroundColor = getColor()
    }
    
    @IBOutlet weak var endColorView: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    @IBOutlet weak var opacityTF: UITextField!
    
    @IBAction func redTFDidEditing(_ sender: UITextField) {
        guard let text = sender.text else { return }
        redSlider.value = Float(text) ?? 0.0
        changeViewColor()
    }
    @IBAction func blueTFDidEditing(_ sender: UITextField) {
        guard let text = sender.text else { return }
        blueSlider.value = Float(text) ?? 0.0
        changeViewColor()
    }
    @IBAction func greenTFDidEditing(_ sender: UITextField) {
        guard let text = sender.text else { return }
        greenSlider.value = Float(text) ?? 0.0
        changeViewColor()
    }
    
    @IBOutlet weak var opacitySlider: UISlider!
    
    @IBAction func opacityTFDidEditing(_ sender: UITextField) {
        guard let text = sender.text else { return }
        guard var value = Float(text) else { return }
        value /= 100
        opacitySlider.value = Float(value)
        changeViewColor()
    }
    
    @IBAction func hexTFEdited(_ sender: UITextField) {
        
    }
    
    @IBAction func redSliderMove(_ sender: UISlider) {
        redTextField.text = String(format: "%.2f", sender.value)
        changeViewColor()
    }
    
    @IBAction func blueSliderMove(_ sender: UISlider) {
        blueTextField.text = String(format: "%.2f", sender.value)
        changeViewColor()
    }
    
    @IBAction func greenSliderMove(_ sender: UISlider) {
        greenTextField.text = String(format: "%.2f", sender.value)
        changeViewColor()
        
    }
    
    @IBAction func opacitySliderMoving(_ sender: UISlider) {
        opacityTF.text = "\(String(format: "%.2f", opacitySlider.value * 100))%"
        endColorView.layer.opacity = sender.value
        changeViewColor()
    }
    
    @IBAction func doneTapped() {
        self.endColor = getColor()
        delegate?.updateColor(color: endColor ?? UIColor.clear)
        self.navigationController?.popToRootViewController(animated: true)
    }
}
