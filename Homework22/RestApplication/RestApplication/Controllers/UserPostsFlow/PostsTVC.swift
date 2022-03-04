//
//  PostsTVC.swift
//  RestApplication
//
//  Created by Ярослав Антонович on 03.03.2022.
//

import UIKit

class PostsTVC: UITableViewController {

    private var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavController()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createPost" {
            guard let dest = segue.destination as? CreatePostVC else { return }
            self.posts.append(dest.post ?? Post(userId: nil, id: nil, title: nil, body: nil))
            dest.closure = { [weak self] post in
                self?.posts.append(post)
                print(post)
                self?.tableView.reloadData()
            }
           
        } else {
            guard let dest = segue.destination as? CommentsTVC else { return }
            let postID = sender as! Int
            dest.fetchData(with: URL(string: "\(APIManager.commentsPath)?postId=\(postID + 1)")!)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
    
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return posts.count
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostCell
        cell.titleLabel.text = posts[indexPath.row].title
        cell.bodyLabel?.text = (posts[indexPath.row].body) ?? ""
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toComments", sender: indexPath.row)
    }
    
    func fetchData(with url: URL) {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            do {
                guard let json = data else { return }
                self.posts = try JSONDecoder().decode([Post].self, from: json)
            } catch let error {
                print(error.localizedDescription)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }.resume()
    }
    
    @objc func addPost() {
        performSegue(withIdentifier: "createPost", sender: tableView)
    }
    
    private func setNavController() {
        let addButton = UIBarButtonItem(image: .add, style: .done, target: self, action: #selector(addPost))
        
        self.navigationItem.rightBarButtonItems = [addButton]
    }
}

