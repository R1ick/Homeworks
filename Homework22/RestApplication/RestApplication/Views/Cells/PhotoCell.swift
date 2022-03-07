//
//  PhotoCell.swift
//  RestApplication
//
//  Created by Ярослав Антонович on 06.03.2022.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class PhotoCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var photo: JSON!
    
    func configureCell() {
        imageView.image = UIImage(systemName: "photo")
        activityIndicator.startAnimating()
    }
    
    func getThumbnail() {
        if let thumbnailURL = photo["thumbnailUrl"].string {
            if let image = CacheManager.shared.imageCache.image(withIdentifier: thumbnailURL) {
                self.imageView.image = image
                self.activityIndicator.stopAnimating()
            } else {
                AF.request(thumbnailURL).responseImage { [weak self] response in
                    switch response.result {
                    case .success(let data):
                        self?.activityIndicator.stopAnimating()
                        self?.imageView.image = data
                        CacheManager.shared.imageCache.add(data, withIdentifier: thumbnailURL)
                    case .failure(let error):
                        print(error)
                        print(#line, #function)
                    }
                }
            }
        }
    }
}
