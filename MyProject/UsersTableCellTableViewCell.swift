//
//  UsersTableCellTableViewCell.swift
//  MyProject
//
//  Created by Саша Восколович on 11.06.2023.
//
// This class represents a view controller that displays users information using a table view.
import UIKit

class UsersTableCellTableViewCell: UITableViewCell {
    
    
    // Label for displaying the name
    let nameLabel = ObjectsFactory.createLabel(text: "", fontSize: 18)
    
    // Label for displaying the last name
    let lastNameLabel = ObjectsFactory.createLabel(text: "", fontSize: 18)
    
    // Label for displaying the description
    let descriptionLabel = ObjectsFactory.createLabel(text: "", fontSize: 15)
   
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        descriptionLabel.text = information.description
    }
}
