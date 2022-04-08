//
//  StarterView.swift
//  TimerSwiftUI
//
//  Created by Martynov Evgeny on 5.04.22.
//

import SwiftUI

struct StarterView: View {
    
    @EnvironmentObject var user: UserManager
    @AppStorage("isReg") var isReg: Bool = false
    
    var body: some View {
        // Тип, который собирает несколько экземпляров типа контента,
        // например представлений, сцен или команд, в один блок.
        Group {
            if isReg {
                ContentView()
            } else {
                RegisterView()
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
            .environmentObject(UserManager())
    }
}
