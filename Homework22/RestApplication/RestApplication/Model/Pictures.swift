//
//  Pictures.swift
//  RestApplication
//
//  Created by Ярослав Антонович on 27.02.2022.
//

import UIKit

struct Picture {
    let imageURL: String
}

struct PictureStorage {
    
    private init() {}
    
    static let shared = PictureStorage()
    
    let pictures: [Picture] = [
        Picture(imageURL: "https://thumbs.dreamstime.com/z/powerful-ocean-wave-13204611.jpg"),
        Picture(imageURL:  "https://images.unsplash.com/photo-1567354336146-db813e004988?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3432&q=80"),
        Picture(imageURL: "https://images.unsplash.com/photo-1570125909961-96fb5f0238ad?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80"),
        Picture(imageURL:  "https://images.unsplash.com/photo-1565490952509-989db0cdb8ca?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80"),
        Picture(imageURL: "https://images.unsplash.com/photo-1563547258609-18c0e846043d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3226&q=80"),
        Picture(imageURL:  "https://images.unsplash.com/photo-1597594157575-559bfe65cbaf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2274&q=80"),
        Picture(imageURL:  "https://images.unsplash.com/pрhoto-1619921845646-6216752a036c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80"), // failed
        Picture(imageURL:  "https://images.unsplash.com/photo-1563779480177-20d7c3ab233b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2671&q=80"),
        Picture(imageURL:  "https://images.unsplash.com/photo-1624247743536-12543fe8d959?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80")
    ]
}
