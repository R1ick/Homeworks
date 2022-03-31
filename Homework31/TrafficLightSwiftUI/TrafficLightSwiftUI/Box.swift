//
//  Box.swift
//  TrafficLightSwiftUI
//
//  Created by Ярослав Антонович on 30.03.2022.
//

import SwiftUI

struct Box: View {
    var body: some View {
        Color(uiColor: .black)
            .frame(width: 200, height: 550)
            .cornerRadius(20)
    }
}

struct Box_Previews: PreviewProvider {
    static var previews: some View {
        Box()
    }
}
