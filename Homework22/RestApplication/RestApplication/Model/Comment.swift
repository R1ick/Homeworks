//
//  Comment.swift
//  RestApplication
//
//  Created by Ярослав Антонович on 03.03.2022.
//

import Foundation

struct Comment: Decodable {
    let postId: Int?
    let id: Int?
    let name: String?
    let email: String?
    let body: String?
}
