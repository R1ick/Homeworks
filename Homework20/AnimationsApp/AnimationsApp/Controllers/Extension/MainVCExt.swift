//
//  MainVCExt.swift
//  AnimationsApp
//
//  Created by Ярослав Антонович on 23.02.2022.
//

import UIKit

extension MainVC {
    @IBAction func presentCurvePicker() {
        pickerSuperView.animation = AnimationType.slideUp.rawValue
        pickerSuperView.force = 0.9
        pickerSuperView.duration = 0.5
        pickerSuperView.delay = 0.2
        pickerSuperView.isHidden = false
        pickerSuperView.animate()
    }
    
    internal func showWarningAlert() {
        let warning = UIAlertController(title: "Warning", message: "You don't choose the curve type", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Choose", style: .default) { _ in
            self.presentCurvePicker()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        warning.addAction(ok)
        warning.addAction(cancel)
        self.present(warning, animated: true)
    }
}

extension MainVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Curve.allCases.count
    }
}

extension MainVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let title = Curve.allCases[row].rawValue
        
        return title
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let item = Curve.allCases[row].rawValue
        curveValueLabel.text = item
        mainView.curve = item
        pickerSuperView.animation = AnimationType.fall.rawValue
        pickerSuperView.force = 0.9
        pickerSuperView.duration = 1
        pickerSuperView.delay = 0.2
        pickerSuperView.animate()
    }
}
