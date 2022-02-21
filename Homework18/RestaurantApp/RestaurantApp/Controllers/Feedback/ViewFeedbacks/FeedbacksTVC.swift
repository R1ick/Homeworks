//
//  FeedbacksVC.swift
//  RestaurantApp
//
//  Created by Ярослав Антонович on 16.02.2022.
//

import UIKit

class FeedbacksTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        registerCell(tableView)
        hideKeyboardWhenTappedAround()
    }
        
    var index = 0
}
    // MARK: - Table view data source
extension FeedbacksTVC {
    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return StorageManager.shared.meals[index].feedbacks.count
    }
}
    // MARK: - Table view delegate and navigation
extension FeedbacksTVC {
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let defaultCell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? Cell else { return defaultCell }
        let feedback = StorageManager.shared.meals[index].feedbacks[indexPath.row]
        
        cell.dateLabel.text = feedback.currentDate
        cell.reviewLabel.text = feedback.text
        cell.ratingLabel.text = feedback.rating
        
        print(feedback.images?.count)
        
        switch feedback.images?.count {
        case 0:
            checkImages(at: cell, for: indexPath.row)
            break
        case 1:
            checkImages(at: cell, for: indexPath.row)
            cell.firstPic.image = feedback.images?[0]
        case 2:
            checkImages(at: cell, for: indexPath.row)
            cell.firstPic.image = feedback.images?[0]
            cell.secondPic.image = feedback.images?[1]
        case 3:
            checkImages(at: cell, for: indexPath.row)
            cell.firstPic.image = feedback.images?[0]
            cell.secondPic.image = feedback.images?[1]
            cell.thirdPic.image = feedback.images?[2]
        default: break
        }
        
        return cell
    }
}

extension FeedbacksTVC {
    fileprivate func registerCell(_ tableView: UITableView) {
        let nib = UINib(nibName: "Cell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
    }
    
    fileprivate func checkImages(at cell: UITableViewCell, for indexPath: Int) {
        guard let cell = cell as? Cell else { return }
        if StorageManager.shared.meals[index].feedbacks[indexPath].images!.count > 0 {
            cell.imagesStack.isHidden = false
            cell.bottomConstraint.constant = 10
        } else {
            cell.bottomConstraint.constant = -100
            cell.imagesStack.isHidden = true
        }
    }
}
