//
//  LightCircle.swift
//  TrafficLightSwiftUI
//
//  Created by Ярослав Антонович on 30.03.2022.
//

import SwiftUI

struct LightCircle: View {
    
    var color: Color
    
    var body: some View {
        Circle()
            .foregroundColor(color)
            .overlay(Circle().stroke(lineWidth: 3))
            .frame(width: 150, height: 150)
    }
}

struct LightCircle_Previews: PreviewProvider {
    static var previews: some View {
        LightCircle(color: .red)
    }
}
