//
//  TimeCounter.swift
//  DataFlowSwiftUI
//
//  Created by Martynov Evgeny on 5.04.22.
//

import Foundation
import Combine // помогает реализовать архитектуру MVVM

class TimeCounter: ObservableObject {
    
    var objectWillChange = PassthroughSubject<TimeCounter, Never>()
    // Субъект, который передает элементы нижестоящим подписчикам.
    // Мы будем уведомлять подписчиков о изменении TimeCounter
    
    var counter = 3
    var timer: Timer?
    var buttonTitle = "Start"
    
    func startTimer() {
        if counter > 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(updateCounter),
                userInfo: nil,
                repeats: true
            )
        }
        
        buttonUIStateUpdate()
    }
    
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            buttonTitle = "Reset"
        }
        
        objectWillChange.send(self) // отправим подписчикам обновление своего состояния
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func buttonUIStateUpdate() {
        if buttonTitle == "Reset" {
            counter = 3
            buttonTitle = "Start"
        } else {
            buttonTitle = "Wait..."
        }
        
        objectWillChange.send(self)
    }
}
