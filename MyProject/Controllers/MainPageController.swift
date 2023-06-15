//
//  ViewController.swift
//  MyProject
//
//  Created by Саша Восколович on 06.06.2023.
//

import UIKit

class MainPageController: UIViewController {
    
    var nameLabel: UILabel!  // Label to display "Name:"
    var lastNameLabel: UILabel!// Label to display "LastName:"
    var descriptionLabel: UILabel!// Label to display "LastName:"
    var nameField: UITextField!// Text field to enter the name
    var lastNameField: UITextField!// Text field to enter the last name
    var saveButton: UIButton!// Button to save the name and last name
    var descriptionField: UITextView!// Text view to display a description
    
 
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backGroundControllersColor// Set the background color of the view to white
        createObjects()// Initialize and configure UI elements
        drawObjects()// Add UI elements to the view
        setUpObjects()// Set auto layout constraints for UI elements
        configureActionForSaveButton()// Add target actions for button
    }
    
   
     // Draw objects on the view
    func drawObjects() {
        [nameLabel, lastNameLabel, descriptionLabel, nameField, lastNameField,descriptionField,saveButton].forEach {
            view.addSubview($0)
        }
    }
    
  
    
    
// MARK: Initializers objects
    
    // Create and configure UI elements
    private func createObjects() {
        nameLabel = ObjectsFactory.createLabel(text: "Name:",fontSize: 18)
        lastNameLabel =  ObjectsFactory.createLabel(text: "LastName:",fontSize: 18)
        descriptionLabel =  ObjectsFactory.createLabel(text: "Description:",fontSize: 18)
        nameField =  ObjectsFactory.createTextField(placeholder:"Enter your name")
        lastNameField =  ObjectsFactory.createTextField(placeholder:"Enter your Last Name")
        descriptionField =  ObjectsFactory.createTextView()
        saveButton =  ObjectsFactory.createButton(title: "Save")
        
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
    func configureActionForSaveButton() {
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
            
            let userInfo = UserInfo(name: name, lastName: lastName, description: description)
            DataStorage.shared.users.append(userInfo)
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





