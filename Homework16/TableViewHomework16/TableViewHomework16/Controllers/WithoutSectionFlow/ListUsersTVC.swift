//
//  ListUsertsTVC.swift
//  TableViewHomework16
//
//  Created by Ярослав Антонович on 08.02.2022.
//

import UIKit

final class ListUsersTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUserInfo()
        setPersonData(names: names, surnames: surnames)
        
        registerCell(tableView: tableView)
    }
    
    static var users = [Person]()
    private var names = [String]()
    private var surnames = [String]()

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return names.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let defaultCell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as? Cell else { return defaultCell }
        cell.userName.font = UIFont(name: "American Typewriter", size: 22)
        cell.userSurname.font = UIFont(name: "American Typewriter", size: 22)
        cell.userName.text = names[indexPath.row]
        cell.userSurname.text = surnames[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: nil)
    }
    
    //MARK: - Private functions
  
    private func setUserInfo() {
        for index in 1...10 {
            self.names.append("Name\(index) ")
            self.surnames.append("Surname\(index)")
            names.shuffle()
            surnames.shuffle()
        }
    }
    private func setPersonData(names: [String], surnames: [String]){
        for index in 1...10 {
            lazy var phone = Int64.random(in: 100000000...999999999)
            let person = Person(name: names[index - 1], surname: surnames[index - 1],
                                email: "\(surnames[index - 1])@mail.com".lowercased(), phone: "+375\(phone)")
            ListUsersTVC.users.append(person)
        }
    }
   
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DetailUserVC,
              segue.identifier == "toDetail" else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        destination.navigationItem.title = ListUsersTVC.users[indexPath.row].name + ListUsersTVC.users[indexPath.row].surname
        destination.userMail = "Email: \(ListUsersTVC.users[indexPath.row].email)"
        destination.userPhone = "Phone: \(ListUsersTVC.users[indexPath.row].phone)"
    }
}

extension ListUsersTVC: RegisterCellProtocol {
    func registerCell(tableView: UITableView) {
        let nib = UINib(nibName: "UserCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell1")
    }
}
