//
//  ColorView.swift
//  ViewColorsSwiftUI
//
//  Created by Ярослав Антонович on 05.04.2022.
//

import SwiftUI

struct ColorSlider: View {
    
    @Binding var value: Double
    @State var text: String = ""
    
    var body: some View {
        HStack(alignment: .center) {
            Slider(value: $value, in: 0...255, step: 1)
                .onChange(of: value) { newValue in
                    text = "\(newValue)"
                }
            TFView(value: $value, text: $text)
        }
        .padding()
    }
}
