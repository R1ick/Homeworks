//
//  DetailUserVC.swift
//  RestApplication
//
//  Created by Ярослав Антонович on 03.03.2022.
//

import UIKit

class DetailUserVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var suiteLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var zipcodeLabel: UILabel!
    @IBOutlet weak var geoLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var catchPhraseLabel: UILabel!
    @IBOutlet weak var bsLabel: UILabel!
    
    var user: User?
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPosts" {
            guard let dest = segue.destination as? PostsTVC else { return }
            dest.fetchData(with: URL(string: "\(APIManager.postsPath)?userId=\(index + 1)")!)
            dest.navigationItem.title = "Posts"
        } else {
            guard let dest = segue.destination as? AlbumsTVC else { return }
            dest.fetchData(with: URL(string: "\(APIManager.albumsPath)?userId=\(index + 1)")!)
            dest.navigationItem.title = "Albums"
        }
    }
    
    @IBAction func postsButtonAction() {
        performSegue(withIdentifier: "toPosts", sender: index)
    }
    
    @IBAction func albumsButtonACtion() {
        performSegue(withIdentifier: "toAlbums", sender: index)
    }
    
    private func setupUI() {
        nameLabel.text = user?.name
        usernameLabel.text = user?.username
        emailLabel.text = user?.email
        streetLabel.text = user?.address?.street
        suiteLabel.text = user?.address?.suite
        cityLabel.text = user?.address?.city
        zipcodeLabel.text = user?.address?.zipcode
        geoLabel.text = "lat" + (user?.address?.geo?.lat ?? "") + ",lng" + (user?.address?.geo?.lng ?? "")
        phoneLabel.text = user?.phone
        websiteLabel.text = user?.website
        companyNameLabel.text = user?.company?.name
        catchPhraseLabel.text = user?.company?.catchPhrase
        bsLabel.text = user?.company?.bs
    }
}
