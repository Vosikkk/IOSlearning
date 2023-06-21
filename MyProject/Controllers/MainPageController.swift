//
//  ViewController.swift
//  MyProject
//
//  Created by Саша Восколович on 06.06.2023.
//

import UIKit

class MainPageController: UIViewController {
    
    // MARK: - UI Elements
  private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name:"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .textColor
        return label
    }()
    
    private lazy var lastNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "LastName:"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .textColor
        return label
    }()
   
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Description:"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .textColor
        return label
    }()
    
    private lazy var nameField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 7
        textField.layer.borderColor = UIColor.borderColorForFields.cgColor
        textField.contentVerticalAlignment = .center
        textField.textAlignment = .left
        textField.placeholder = "Enter your name"
        return textField
    }()
    
    private lazy var lastNameField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 7
        textField.layer.borderColor = UIColor.borderColorForFields.cgColor
        textField.contentVerticalAlignment = .center
        textField.textAlignment = .left
        textField.placeholder = "Enter your last name"
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .backGroundButtonColor
        button.setTitle("Save", for: .normal)
        button.tintColor = .buttonTinColor
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    private lazy var descriptionField: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.borderColor = UIColor.borderColorForFields.cgColor
        textView.layer.borderWidth = 0.5
        textView.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        textView.font = UIFont.systemFont(ofSize: 17)
        textView.backgroundColor = .backGroundFiledsColor
        return textView
    }()
    
  
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backGroundControllersColor// Set the background color of the view to white
        drawObjects()// Add UI elements to the view
        setUpObjects()// Set auto layout constraints for UI elements
        configureActionForSaveButton()// Add target actions for button
    }
    
    
    // Draw objects on the view
    func drawObjects() {
        [nameLabel, lastNameLabel, descriptionLabel, nameField, lastNameField, descriptionField, saveButton].forEach {
            view.addSubview($0)
        }
    }
    
  
    // MARK: Set Constraints
    
    // Set up the layout constraints for the UI elements
    private func setUpObjects() {
        // Constraints for labelName
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nameLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 5),
            nameLabel.widthAnchor.constraint(equalToConstant: 55)
        ])
        // Constraints for labelLastName
        NSLayoutConstraint.activate([
            lastNameLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 45),
            lastNameLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 5)
        ])
        // Constraints for fieldForName
        NSLayoutConstraint.activate([
            nameField.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 2),
            nameField.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            nameField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -5)
        ])
        // Constraints for fieldForLastName
        NSLayoutConstraint.activate([
            lastNameField.leftAnchor.constraint(equalTo: lastNameLabel.rightAnchor, constant: 5),
            lastNameField.centerYAnchor.constraint(equalTo: lastNameLabel.centerYAnchor),
            lastNameField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -5)
        ])
        // Constraints for labelDescription
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: lastNameLabel.topAnchor, constant: 50),
            descriptionLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 5)
        ])
        // Constraints for textDescription
        NSLayoutConstraint.activate([
            descriptionField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            descriptionField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 5),
            descriptionField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -5),
            descriptionField.heightAnchor.constraint(equalToConstant: 130)
        ])
        // Constraints for firstButton(save)
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: descriptionField.bottomAnchor, constant: 15),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
}
// MARK: Saving User Information

extension MainPageController {
    
    // Add target action for the first button
  private func configureActionForSaveButton() {
        saveButton.addTarget(self, action: #selector(buttonSaveAction), for:.touchUpInside)
        
    }
    
    // This function is triggered when the firstButton is pressed. It retrieves the name, last name, and description from the text fields,
    // checks if they are not empty. If any field is empty, it shows an alert prompting the user to fill in the required information.
    // If all fields are filled, it creates a UserInfo object and adds it to the usersStorage array.
    // It also clears the text fields and sets the focus back to the name text field.
    @objc private func buttonSaveAction(sender: UIButton) {
        
        guard let name = nameField.text, !name.isEmpty else {
            showAlert(withTitle: "Error", message: "Please enter your name")
            return
            
        }
        guard let lastName = lastNameField.text, !lastName.isEmpty else {
            showAlert(withTitle: "Error", message: "Please enter your last name")
            return
            
        }
        guard let description = descriptionField.text, !description.isEmpty else {
            showAlert(withTitle: "Error", message: "Please tell me about yourself")
            return
            
        }
        let user = User(name: name, lastName: lastName, descriptionInfo: description)
        DataStorage.shared.saveUsers(user: user)
        makeFieldsClear()
        nameField.becomeFirstResponder()// Set focus on the name text field
    }
    
    // Create an alert to show information to the user when they have not filled in a required field.
    private func showAlert(withTitle title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    // Make filelds empty when we are saved new user
    private func makeFieldsClear(){
        nameField.text = "" // Clear the name text field
        lastNameField.text = ""// Clear the last name text field
        descriptionField.text = ""
    }
}





