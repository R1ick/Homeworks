//
//  Post.swift
//  RestApplication
//
//  Created by Ярослав Антонович on 02.03.2022.
//

import Foundation

struct Post: Decodable {
    let userId: Int?
    let id: Int?
    let title: String?
    let body: String?
}
