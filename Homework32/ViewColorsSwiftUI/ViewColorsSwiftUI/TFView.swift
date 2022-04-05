//
//  ЕАМшуц.swift
//  ViewColorsSwiftUI
//
//  Created by Ярослав Антонович on 05.04.2022.
//

import SwiftUI

struct TFView: View {
    
    @Binding var value: Double
    @Binding var text: String
    
    var body: some View {
        TextField(String(value), text: $text).onChange(of: text) { _ in
            guard let dbl = Double(text) else {
                text = "0"
                value = 0.0
                return
            }
            value = dbl
        }
        .frame(width: 60)
    }
}
