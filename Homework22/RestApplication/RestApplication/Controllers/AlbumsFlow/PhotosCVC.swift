//
//  PhotosCVC.swift
//  RestApplication
//
//  Created by Ярослав Антонович on 06.03.2022.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class PhotosCVC: UICollectionViewController {
    
    private var photos = [JSON]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dest = segue.destination as? PhotoVC else { return }
        dest.photo = sender as! JSON
        dest.getData()
    }
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
       return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        cell.photo = photos[indexPath.row]
        cell.configureCell()
        cell.getThumbnail()
        
       return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photo = photos[indexPath.row]
        performSegue(withIdentifier: "toPhoto", sender: photo)
    }
}

extension PhotosCVC {
    func fetchData(with url: URL) {
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let data):
                self.photos = JSON(data).arrayValue
                self.collectionView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
