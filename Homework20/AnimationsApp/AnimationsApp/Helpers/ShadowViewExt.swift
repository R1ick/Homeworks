//
//  ShadowViewExt.swift
//  AnimationsApp
//
//  Created by Ярослав Антонович on 23.02.2022.
//

import UIKit

extension UIView {
    func makeShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.7
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 10
    }
}
