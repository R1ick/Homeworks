//
//  RandomColorGenerator.swift
//  AnimationsApp
//
//  Created by Ярослав Антонович on 23.02.2022.
//

import UIKit

struct RandomColorGenerator {
    static func generateRandomColor() -> UIColor {
        let randomRed = CGFloat.random(in: 0...1)
        let randomBlue = CGFloat.random(in: 0...1)
        let randomGreen = CGFloat.random(in: 0...1)
        let randomAlpha = CGFloat.random(in: 0.5...1)
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: randomAlpha)
    }
}
