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
        let feedbacks = StorageManager.shared.meals[index].feedbacks
        
        cell.dateLabel.text = feedbacks[indexPath.row].currentDate
        cell.reviewLabel.text = feedbacks[indexPath.row].text
        cell.ratingLabel.text = feedbacks[indexPath.row].rating
        
        return cell
    }
}

extension FeedbacksTVC {
    fileprivate func registerCell(_ tableView: UITableView) {
        let nib = UINib(nibName: "Cell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
    }
}
