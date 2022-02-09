//
//  DetailListUsersTVC.swift
//  TableViewHomework16
//
//  Created by Ярослав Антонович on 08.02.2022.
//

import UIKit

final class DetailListUsersTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       registerCell(tableView: tableView)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return ListUsersTVC.users.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let defaultCell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1") as? Cell else { return defaultCell }
        cell.backgroundColor = #colorLiteral(red: 0.1885764599, green: 0.6761482358, blue: 0.6151464581, alpha: 0.2877690397)
        cell.textLabel?.textColor = #colorLiteral(red: 0.3128196299, green: 0.1167957857, blue: 0.1568555236, alpha: 1)
        cell.arrowPic.isHidden = true
        cell.userName.font = UIFont(name: "American Typewriter", size: 22)
        
        switch indexPath.row {
        case 0: cell.userName.text = ListUsersTVC.users[indexPath.section].email
        case 1:
            cell.userPic.isHidden = true
            cell.userName.text = ListUsersTVC.users[indexPath.section].phone
        default: break
        }
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.tintColor = #colorLiteral(red: 0.02587666549, green: 0.7226459384, blue: 0.4628112912, alpha: 0.8501138245)
        header.textLabel?.font = UIFont(name: "American Typewriter", size: 22)
        header.textLabel?.textColor = .white
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return ListUsersTVC.users[section].name + ListUsersTVC.users[section].surname
    }

}

extension DetailListUsersTVC: RegisterCellProtocol {
    func registerCell(tableView: UITableView) {
        let nib = UINib(nibName: "UserCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell1")
    }
}
