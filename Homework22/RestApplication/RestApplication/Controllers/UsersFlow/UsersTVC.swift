//
//  UsersTVC.swift
//  RestApplication
//
//  Created by Ярослав Антонович on 02.03.2022.
//

import UIKit

class UsersTVC: UITableViewController {

    private var users = [User]()
    private var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dest = segue.destination as? DetailUserVC else { return }
        dest.user = sender as? User
        dest.index = index
        dest.navigationItem.title = dest.user?.name
    }
    
    func fetchData(with url: URL) {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            do {
                guard let json = data else { return }
                self.users = try JSONDecoder().decode([User].self, from: json)
            } catch let error {
                print(error.localizedDescription)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }.resume()
    }
    
    
}
// MARK: - Table view data source
extension UsersTVC {

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return users.count
    }
}
// MARK: - Table view delegate
extension UsersTVC {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = users[indexPath.row].name
        cell?.textLabel?.numberOfLines = 0
        cell?.detailTextLabel?.text = users[indexPath.row].email
        cell?.detailTextLabel?.numberOfLines = 0
        
        return cell!
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: "toDetail", sender: users[index])
    }
}
