//
//  SideMenuVC.swift
//  AnimationsApp
//
//  Created by Ярослав Антонович on 24.02.2022.
//

import UIKit
import SideMenu

class Preferences {
    static let shared = Preferences()
    var enableTransitionAnimation = false
}

class SideMenuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMenu()
        guard let menu = navigationController as? SideMenuNavigationController, menu.blurEffectStyle == nil else {
            return
        }
        setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = StorageManager.shared.accentColor
    }
    @IBOutlet weak var selectionMenuTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var forceValueLabel: UILabel!
    @IBOutlet weak var durationValueLabel: UILabel!
    @IBOutlet weak var delayValueLabel: UILabel!
    @IBOutlet weak var curveValueLabel: UILabel!
    
    private func setupUI() {
        
    }
}

extension SideMenuVC {
    
    func setupMenu() {
        let storage = StorageManager.shared
        forceValueLabel.text = storage.force
        durationValueLabel.text = storage.duration
        delayValueLabel.text = storage.delay
        curveValueLabel.text = storage.curve
    }
}
