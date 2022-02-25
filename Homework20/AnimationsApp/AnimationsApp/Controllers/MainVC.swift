//
//  MainVC.swift
//  AnimationsApp
//
//  Created by Ярослав Антонович on 23.02.2022.
//

import UIKit
import Spring
import SideMenu

final class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupSideMenu()
        updateMenus()
        mainView.makeShadow()
        StorageManager.shared.curve = ""
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sideMenuNavigationController = segue.destination as? SideMenuNavigationController else { return }
        sideMenuNavigationController.settings = makeSettings()
        saveValues()
    }
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var mainView: SpringView!
    @IBOutlet weak var mainButton: SpringButton!
    @IBOutlet weak var forceValueLabel: UILabel!
    @IBOutlet weak var durationValueLabel: UILabel!
    @IBOutlet weak var delayValueLabel: UILabel!
    @IBOutlet weak var curveValueLabel: UILabel!
    @IBOutlet weak var forceSlider: UISlider!
    @IBOutlet weak var delaySlider: UISlider!
    @IBOutlet weak var durationSlider: UISlider!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var pickerSuperView: SpringView!
    
    private var accentColor: UIColor?
    
    @IBAction func menuButtonAction(_ sender: Any) {
        self.performSegue(withIdentifier: "menu", sender: nil)
    }
    
}

extension MainVC {
    @IBAction func mainButtonAction(_ sender: SpringButton) {
        let animation = AnimationType.allCases.randomElement()!.rawValue
        mainView.animation = animation
        mainLabel.text = animation
        if curveValueLabel.text == "click here" {
            showWarningAlert()
            return
        }
        accentColor = RandomColorGenerator.generateRandomColor()
        mainView.backgroundColor = accentColor
        [forceSlider, durationSlider, delaySlider].forEach { $0?.tintColor = accentColor }
        saveValues()
        mainView.animate()
    }
    @IBAction func forceValueChanged(_ sender: UISlider) {
        forceValueLabel.text = String(format: "%.2f", sender.value)
        mainView.force = CGFloat(sender.value)
    }
    @IBAction func durationValueChanged(_ sender: UISlider) {
        durationValueLabel.text = String(format: "%.2f", sender.value)
        mainView.duration = CGFloat(sender.value)
    }
    @IBAction func delayValueChanged(_ sender: UISlider) {
        delayValueLabel.text = String(format: "%.2f", sender.value)
        mainView.delay = CGFloat(sender.value)
    }
    
    private func setupUI() {
        pickerSuperView.isHidden = true
        pickerView.dataSource = self
        pickerView.delegate = self
        mainView.layer.cornerRadius = mainButton.layer.frame.size.height * 2
        
        forceValueLabel.text = "0.50"
        delayValueLabel.text = "0.50"
        durationValueLabel.text = "0.50"
        curveValueLabel.text = "click here"
        
        pickerSuperView.layer.cornerRadius = 25
        pickerSuperView.makeShadow()
        
        accentColor = RandomColorGenerator.generateRandomColor()
        
        [forceSlider, durationSlider, delaySlider].forEach { $0?.tintColor = accentColor }
        mainView.backgroundColor = accentColor
    }
    
    private func saveValues() {
        let storage = StorageManager.shared
        storage.force = forceValueLabel.text!
        storage.duration = durationValueLabel.text!
        storage.delay = delayValueLabel.text!
        storage.curve = curveValueLabel.text!
        storage.accentColor = accentColor!
    }
}

