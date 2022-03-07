//
//  PhotoVC.swift
//  RestApplication
//
//  Created by Ярослав Антонович on 06.03.2022.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class PhotoVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var photo: JSON!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        imageView.image = UIImage(systemName: "photo")
    }
    
    func getData() {
        if let URL = photo["url"].string {
            if let image = CacheManager.shared.imageCache.image(withIdentifier: URL) {
                self.imageView.image = image
                self.activityIndicator.stopAnimating()
            } else {
                AF.request(URL).responseImage { [weak self] response in
                    switch response.result {
                    case .success(let data):
                        self?.activityIndicator.stopAnimating()
                        self?.imageView.image = data
                        CacheManager.shared.imageCache.add(data, withIdentifier: URL)
                    case .failure(let error):
                        print(error)
                        print(#line, #function)
                    }
                }
            }
        }
    }
}
