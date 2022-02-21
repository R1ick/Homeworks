//
//  CameraAccessManager.swift
//  RestaurantApp
//
//  Created by Ярослав Антонович on 19.02.2022.
//

import AVKit

class CameraAccessManager {
    
    private init() {}
    
    static let shared = CameraAccessManager()
    
    func checkPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    self.result = granted
                }
            }
        case .restricted:
            return
        case .denied:
            return
        case .authorized:
            self.result = true
        @unknown default:
            return
        }
    }
    
    var result = false
}
