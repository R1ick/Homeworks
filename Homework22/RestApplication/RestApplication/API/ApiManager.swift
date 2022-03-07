//
//  ApiManager.swift
//  RestApplication
//
//  Created by Ярослав Антонович on 02.03.2022.
//

import Foundation

struct APIManager {
    static let serverPath = "https://jsonplaceholder.typicode.com"
    static let postsPath = serverPath + "/posts"
    static let albumsPath = serverPath + "/albums"
    static let photosPath = serverPath + "/photos"
    static let commentsPath = serverPath + "/comments"
    static let usersPath = serverPath + "/users"
    static let usersUrl = URL(string: usersPath)
}
