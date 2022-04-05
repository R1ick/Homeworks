//
//  ContentView.swift
//  ViewColorsSwiftUI
//
//  Created by Ярослав Антонович on 04.04.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var red: Double = 0.0
    @State var green: Double = 0.0
    @State var blue: Double = 0.0
    @State var redValue = 0.0
    @State var greenValue = 0.0
    @State var blueValue = 0.0
    
    var body: some View {
        VStack(alignment: .center)  {
            ColorView(red: red, green: green, blue: blue)
            ColorView(red: redValue, green: greenValue, blue: blueValue)
            Spacer()
            ColorSlider(value: $red)
                .tint(.red)
            ColorSlider(value: $green)
                .tint(.green)
            ColorSlider(value: $blue)
                .tint(.blue)
            Spacer()
            Button {
                redValue = red
                greenValue = green
                blueValue = blue
            } label: {
                Text("Change the second view color")
                    .bold()
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
