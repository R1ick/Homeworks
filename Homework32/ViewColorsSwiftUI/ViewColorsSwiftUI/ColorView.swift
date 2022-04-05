//
//  ColorView.swift
//  ViewColorsSwiftUI
//
//  Created by Ярослав Антонович on 05.04.2022.
//

import SwiftUI

struct ColorView: View {
    var red: Double
    var green: Double
    var blue: Double
    
    var body: some View {
        Color(red: red / 255, green: green / 255, blue: blue / 255)
            .cornerRadius(25)
            .frame(width: 300, height: 150)
    }
}
