//
//  AlbumsTVC.swift
//  RestApplication
//
//  Created by Ярослав Антонович on 06.03.2022.
//

import UIKit
import Alamofire
import SwiftyJSON

class AlbumsTVC: UITableViewController {
    
    private var albums: [JSON] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dest = segue.destination as? PhotosCVC else { return }
        let index = sender as! Int
        dest.fetchData(with: URL(string: "\(APIManager.photosPath)?albumId=\(index + 1)")!)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
      
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return albums.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let album = albums[indexPath.row]
        cell?.textLabel?.text = String(album["id"].int ?? 0)
        cell?.detailTextLabel?.text = album["title"].string ?? ""
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        performSegue(withIdentifier: "toPhotos", sender: index)
    }
}

extension AlbumsTVC {
    func fetchData(with url: URL) {
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let data):
                self.albums = JSON(data).arrayValue
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
