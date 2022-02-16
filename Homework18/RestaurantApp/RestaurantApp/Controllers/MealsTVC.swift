//
//  MealsTVC.swift
//  RestaurantApp
//
//  Created by Ярослав Антонович on 16.02.2022.
//

import UIKit

class MealsTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell(tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    private var mealIndex = 0
}
    // MARK: - Table view data source

extension MealsTVC {
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return StorageManager.shared.meals.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

    // MARK: - Table view Delegate and Navigation

extension MealsTVC {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let defaultCell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath) as? MealCell else { return defaultCell }
        
        [
        cell.nameLabel,
        cell.mealPrice
        ].forEach { $0?.font = UIFont(name: "System", size: 16) }
        
        cell.nameLabel.text = StorageManager.shared.meals[indexPath.row].name
        cell.mealPrice.text = String(StorageManager.shared.meals[indexPath.row].price) + " руб\n"
        cell.mealRating.text = StorageManager.shared.meals[indexPath.row].ratingBar
        cell.mealImage.image = StorageManager.shared.meals[indexPath.row].image
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toDetail",
              let detailVC = segue.destination as? MealDetailVC,
              let indexPath = tableView.indexPathForSelectedRow
        else { return }
        detailVC.navigationItem.title = StorageManager.shared.meals[indexPath.row].name
        detailVC.mealIndex = indexPath.row
    }
}

extension MealsTVC {
    fileprivate func registerCell(_ tableView: UITableView) {
        let nib = UINib(nibName: "MealCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MealCell")
    }
}
