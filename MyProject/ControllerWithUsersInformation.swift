//
//  ControllerWithUsersInformation.swift
//  MyProject
//
//  Created by Саша Восколович on 11.06.2023.
//
// This class represents a view controller that displays users information using a table view.
// It conforms to the UITableViewDataSource protocol to provide the necessary data for the table view.
// The users property holds an array of UserInfo objects representing the user data to be displayed.



import UIKit

class ControllerWithUsersInformation: UIViewController {

    
    var users: [UserInfo] = []
    
    // Initialize a new instance of the UITableView
    let tableView: UITableView = .init()
    
    
// MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        
        view.backgroundColor = .white
        
        tableView.register(UsersTableCellTableViewCell.self, forCellReuseIdentifier: "UsersTableCellTableViewCell")
        
        tableView.dataSource = self
       }
}


// MARK: User Information
struct UserInfo {
      var name: String?
      var lastName: String?
      var description: String?
      
}

// MARK:  UITableViewDataSource
extension ControllerWithUsersInformation: UITableViewDataSource {
    
   
    
    // Our view will know how many rows we need to create
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    
    // Create one cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UsersTableCellTableViewCell", for: indexPath) as? UsersTableCellTableViewCell else {fatalError()
        }
        
        cell.configure(information: users[indexPath.row])
        return cell
    }
}


// MARK:  Setup our table
extension ControllerWithUsersInformation {
    
    func setUpTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
  
