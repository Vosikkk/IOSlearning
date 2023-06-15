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

class UsersInformationController: UIViewController {
    
    
    
    
    // Initialize a new instance of the UITableView
    let tableView: UITableView = .init()
    
    
// MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        view.backgroundColor = .backGroundControllersColor
        tableView.register(UsersTableCell.self, forCellReuseIdentifier: "UsersTableCell")
        tableView.dataSource = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Update our table
        tableView.reloadData()
    }
}


// MARK:  UITableViewDataSource
extension UsersInformationController: UITableViewDataSource {
    
    
    
    // Our view will know how many rows we need to create
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataStorage.shared.users.count
    }
    
    
    // Create one cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UsersTableCell", for: indexPath) as? UsersTableCell else {fatalError()
        }
        
        cell.configure(information: DataStorage.shared.users[indexPath.row])
        return cell
    }
}


// MARK:  Setup our table
extension UsersInformationController {
    
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

