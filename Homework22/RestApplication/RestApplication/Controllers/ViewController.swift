//
//  ViewController.swift
//  RestApplication
//
//  Created by Ярослав Антонович on 27.02.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private let storage = PictureStorage.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.hidesWhenStopped = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startTimer()
    }
    
    private func startTimer() {
        activityIndicator.startAnimating()
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(fetchImage(timer: )), userInfo: .none, repeats: true)
    }
    
    private func showWaring(text: String) {
        let alert = UIAlertController(title: "Error", message: text, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
    
    @objc func fetchImage(timer: Timer) {
        activityIndicator.startAnimating()
        let randomPicture = storage.pictures.randomElement()!.imageURL
        guard let url = URL(string: randomPicture) else {
            showWaring(text: "Page not found")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                self.showWaring(text: (error?.localizedDescription)!)
                print("error", error?.localizedDescription)
                return
            }
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.imageView.image = image
                }
            }
        }.resume()
    }
}

