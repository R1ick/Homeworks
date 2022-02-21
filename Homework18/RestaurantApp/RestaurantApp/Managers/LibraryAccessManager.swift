//
//  LibraryAccessManager.swift
//  RestaurantApp
//
//  Created by Ярослав Антонович on 19.02.2022.
//

import Foundation
import Photos

class LibraryAccessManager {
    
    private init() {}
    
    static let shared = LibraryAccessManager()
    
    func checkPhotoLibraryPermission() -> Bool {
        let photos = PHPhotoLibrary.authorizationStatus()
        var result = false
        if photos == .notDetermined {
            PHPhotoLibrary.requestAuthorization { status in
                if status == .authorized {
                    result = true
                } else {
                    result = false
                }
            }
        } else {
            result = true
        }
        return result
    }
}

