//
//  CommentsTVC.swift
//  RestApplication
//
//  Created by Ярослав Антонович on 03.03.2022.
//

import UIKit

class CommentsTVC: UITableViewController {
    
    private var comments = [Comment]()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CommentCell
        let comment = comments[indexPath.row]
        cell.nameLabel.text = comment.name
        cell.emailLabel.text = comment.email
        cell.bodyLabel.text = comment.body!
        
        return cell
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            comments.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
    }

    func fetchData(with url: URL) {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            do {
                guard let json = data else { return }
                self.comments = try JSONDecoder().decode([Comment].self, from: json)
            } catch let error {
                print(error.localizedDescription)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }.resume()
    }
}
