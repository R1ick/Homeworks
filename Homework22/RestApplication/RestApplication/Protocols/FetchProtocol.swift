////
////  FetchProtocol.swift
////  RestApplication
////
////  Created by Ярослав Антонович on 03.03.2022.
////
//
//import Foundation
//import UIKit
//
//protocol FetchData {
//    func fetch(with url: URL, decodeType type: DecodeType, tableView: UITableView) -> [Any]
//}
//
//
//enum DecodeType: Any, Decodable {
//    case user
//    case post
//    case comment
//}
//
//extension FetchData {
//    func fetch(with url: URL, decodeType type: DecodeType, tableView: UITableView) -> [Any] {
//        var array = [Any]()
//        URLSession.shared.dataTask(with: url) { data, _, _ in
//            guard let json = data else { return 
//            DispatchQueue.main.async {
//            do {
//                switch type {
//                case .user:
//                    let data = try JSONDecoder().decode([User].self, from: json)
//                    array = data
//                    print(array)
//                case .post:
//                    let data = try JSONDecoder().decode([Post].self, from: json)
//                    array = data
//                case .comment:
//                    let data = try JSONDecoder().decode([Comment].self, from: json)
//                    array = data
//                }
//            } catch let error {
//                print(error.localizedDescription)
//            }
//
//                print(array)
//                tableView.reloadData()
//            }
//        }
//        return array
//    }
//}
