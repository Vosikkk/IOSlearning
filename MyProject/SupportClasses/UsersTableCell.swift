//
//  UsersTableCellTableViewCell.swift
//  MyProject
//
//  Created by Саша Восколович on 11.06.2023.
//
// This class represents a view controller that displays users information using a table view.
import UIKit

class UsersTableCell: UITableViewCell {
    
    
    // Label for displaying the name
    let nameLabel = ObjectsFactory.createLabel(text: "", fontSize: 18)
    
    // Label for displaying the last name
    let lastNameLabel = ObjectsFactory.createLabel(text: "", fontSize: 18)
    
    // Label for displaying the description
    let descriptionLabel = ObjectsFactory.createLabel(text: "", fontSize: 15)
   
    
   // MARK: - Cell Initialization
   
    // This is the initializer for the UITableViewCell subclass
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCell()// Call the method to set up the cell's configuration
    }
    
    // This initializer is required when implementing NSCoding protocol
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Cell Setup
   
    private func setUpCell() {
        
        // Add labels to the cell's content view
        [nameLabel, lastNameLabel, descriptionLabel].forEach {
            contentView.addSubview($0)
          }
        
        // Set the number of lines for the description label to unlimited
        descriptionLabel.numberOfLines = 0
        
        // Set constraints for the labels relative to the content view
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            lastNameLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor),
            lastNameLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 5),
            lastNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    // Configure the labels with the corresponding information
    func configure(information: UserInfo) {
        nameLabel.text = information.name
        lastNameLabel.text = information.lastName
        descriptionLabel.text = information.descriptionInfo
    }
}
