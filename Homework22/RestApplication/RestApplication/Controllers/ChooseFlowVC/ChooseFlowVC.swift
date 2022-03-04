//
//  ChooseFlowVC.swift
//  RestApplication
//
//  Created by Ярослав Антонович on 02.03.2022.
//

import UIKit

class ChooseFlowVC: BaseViewController {
    
    private let buttons = ["Images", "Users"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toUsers" {
            guard let dest = segue.destination as? UsersTVC else { return }
            dest.fetchData(with: APIManager.usersUrl!)
            dest.navigationItem.title = "Users"
        }
    }
}

extension ChooseFlowVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return buttons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "buttonCell", for: indexPath) as! ButtonCell
        cell.titleLabel.text = buttons[indexPath.row]
        cell.layer.cornerRadius = 10
        cell.frame.size.width = self.view.bounds.width - 40
        cell.frame.size.height = 70
        cell.backgroundColor = .placeholderText
        return cell
    }
}

extension ChooseFlowVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0: performSegue(withIdentifier: "toImages", sender: nil)
        case 1: performSegue(withIdentifier: "toUsers", sender: nil)
        default: break
        }
    }
}
