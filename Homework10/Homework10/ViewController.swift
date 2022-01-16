//
//  ViewController.swift
//  Homework10
//
//  Created by Ярослав Антонович on 16.01.2022.
//

import UIKit

@IBDesignable class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

   
    @IBOutlet weak var progressView: UIProgressView! {
        didSet {
            progressView.progress = 0
            progressView.progressTintColor = .white
            progressView.tintColor = .clear
        }
    }
    
    @IBOutlet weak var sliderTF: UITextField! {
        didSet {
            sliderTF.text = "0.0"
        }
    }
    
    @IBOutlet weak var slider: UISlider! {
        didSet {
            slider.value = 0
        }
    }
    
    @IBOutlet weak var datePicker: UIDatePicker! {
        didSet {
            datePicker.datePickerMode = .time
            datePicker.locale = Locale(identifier: "ru_RU")
        }
    }
    
    @IBOutlet weak var setButton: UIButton! {
        didSet {
            setButton.layer.cornerRadius = 30
        }
    }
    
    @IBOutlet weak var timeLabel: UILabel!
    {
        didSet {
            timeLabel.layer.cornerRadius = 10
            timeLabel.layer.masksToBounds = true
            timeLabel.textAlignment = .center
        }
    }
    
    @IBOutlet weak var switchClear: UISwitch!
    
    @IBOutlet weak var clearButton: UIButton!
    {
        didSet {
            clearButton.layer.cornerRadius = 10
        }
    }
    
    @IBAction func sliderTracking(_ sender: UISlider) {
        if slider.isTracking {
            progressView.progress = slider.value
            sliderTF.text = String(format: "%.3f", slider.value)
        }
    }
 
    @IBAction func didEditingTF(_ sender: UITextField) {
        guard let textValue = Float(sender.text!) else {
            return
        }
        slider.value = textValue
        progressView.progress = textValue
    }
    
    @IBAction func setTimeTapped(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let time = formatter.string(from: datePicker.date)
        
        timeLabel.text = time
    }
    
    @IBAction func switchTapped(_ sender: Any) {
        if switchClear.isOn {
            timeLabel.backgroundColor = #colorLiteral(red: 0.1897704005, green: 0.6920734048, blue: 0.7802909613, alpha: 1)
        } else {
            timeLabel.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
    }
    
    @IBAction func clearTapped(_ sender: Any) {
        switchClear.isOn = false
        timeLabel.text = ""
    }
}

