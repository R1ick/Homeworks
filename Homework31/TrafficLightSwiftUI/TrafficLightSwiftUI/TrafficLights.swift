//
//  TrafficLights.swift
//  TrafficLightSwiftUI
//
//  Created by Ярослав Антонович on 30.03.2022.
//

import SwiftUI

struct TrafficLights: View {
    
    @State var redOpacity = 0.2
    @State var orangeOpacity = 0.2
    @State var greenOpacity = 0.2
    @State var index = 0
    
    var body: some View {
        VStack(spacing: -1.0) {
            Color(UIColor.black.cgColor)
                .frame(width: 424, height: 5)
            Color(UIColor.black.cgColor)
                .frame(width: 3, height: 20)
            ZStack {
                Box()
                VStack {
                    redLight
                        .opacity(redOpacity)
                        .animation(.linear(duration: 0.3), value: redOpacity)
                    orangeLight
                        .opacity(orangeOpacity)
                        .animation(.linear(duration: 0.3), value: orangeOpacity)
                    greenLight
                        .opacity(greenOpacity)
                        .animation(.linear(duration: 0.3), value: greenOpacity)
                }
            }
            Spacer()
            Button {
                checkCurrentLight()
            } label: {
                Text("Start")
                    .font(.title)
                    .tint(.green)
            }
        }
    }
    
    private var redLight = LightCircle(color: .red)
    private var orangeLight = LightCircle(color: .orange)
    private var greenLight = LightCircle(color: .green)
    
    func checkCurrentLight() {
        switch index {
        case 0:
            orangeOpacity = 0.2
            redOpacity = 1.0
        case 1:
            orangeOpacity = 1.0
        case 2:
            redOpacity = 0.2
            orangeOpacity = 0.2
            greenOpacity = 1.0
        case 3:
            greenOpacity = 0.2
            orangeOpacity = 1.0
        default: break
        }
        index = index < 3 ? index + 1 : 0
    }
    
}

struct TrafficLights_Previews: PreviewProvider {
    static var previews: some View {
        TrafficLights()
            .previewInterfaceOrientation(.portrait)
    }
}
