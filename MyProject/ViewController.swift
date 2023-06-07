//
//  ViewController.swift
//  MyProject
//
//  Created by Саша Восколович on 06.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var labelName: UILabel!  // Label to display "Name:"
    var labelLastName: UILabel!// Label to display "LastName:"
    var labelDescription: UILabel!// Label to display "LastName:"
    var fieldForName: UITextField!// Text field to enter the name
    var fieldForLastName: UITextField!// Text field to enter the last name
    var firstButton: UIButton!// Button to save the name and last name
    var secondButton: UIButton!// Button to print the number of users
    var textDescription: UITextView!// Text view to display a description
    var storageForFullName: [(String,String)] = []// Array to store tuples of first names and last names
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white// Set the background color of the view to white
        setupObjects()// Initialize and configure UI elements
        drawObjects()// Add UI elements to the view
        setConstrains()// Set auto layout constraints for UI elements
        addActions()// Add target actions for buttons
    }
    
    
    
    private func addActions() {
        firstButton.addTarget(self, action: #selector(buttonFirstPressed), for:.touchUpInside)// Add target action for the first button
        secondButton.addTarget(self, action: #selector(buttonSecondPressed), for:.touchUpInside) // Add target action for the second button
    }
    
    
    // This function is triggered when the firstButton is pressed. It retrieves the name and last name from the text fields,
    // checks if they are not empty, and then saves them in the storageForFullName array.
    // It also clears the text fields and sets the focus back to the name text field.
    @objc private func buttonFirstPressed(sender: UIButton) {
       if let name = fieldForName.text, let lastName = fieldForLastName.text,
                                              !name.isEmpty, !lastName.isEmpty {
            let tupleFullName = (name,lastName)
            storageForFullName.append(tupleFullName)
            fieldForName.text = "" // Clear the name text field
            fieldForLastName.text = ""// Clear the last name text field
            fieldForName.becomeFirstResponder()// Set focus on the name text field
        }
        
    }
    
    // This function show you amount of users in the storage
    @objc private func buttonSecondPressed(sender: UIButton) {
        print(storageForFullName.count) // Print the number of items in the storageForFullName array
    }
    
    
    
    // Draw objects on the view
    func drawObjects() {
        let objects: [UIView] = [labelName,
                                 labelLastName,
                                 fieldForName,
                                 fieldForLastName,
                                 labelDescription,
                                 textDescription,
                                 firstButton,
                                 secondButton]
        
        for object in objects {
            self.view.addSubview(object)// Add each UI element to the view
        }
    }
    
    // Create and configure UI elements
    private func setupObjects() {
        labelName = createLabel("Name:")
        labelLastName = createLabel("LastName:")
        labelDescription = createLabel("Description:")
        fieldForName = createTextField(placeholder:"Enter your name")
        fieldForLastName = createTextField(placeholder:"Enter your Last Name")
        textDescription = createTextDescription()
        firstButton = createButton("Save")
        secondButton = createButton("Print n users")
    }
    
    
    
    
    // Creates and configures a UITextField with the specified placeholder
    private func createTextField (placeholder: String) -> UITextField {
        let res = UITextField()
        res.translatesAutoresizingMaskIntoConstraints = false// Disable autoresizing masks
        res.borderStyle = .roundedRect
        res.layer.borderWidth = 1
        res.layer.cornerRadius = 7
        res.layer.borderColor = UIColor.lightGray.cgColor
        res.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        res.textAlignment = .left
        res.placeholder = placeholder
        return res
    }
    
    
    
    // Creates and configures a UIButton with the specified title
    private func createButton(_ text: String) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false// Disable autoresizing masks
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.setTitle(text, for: .normal)
        button.tintColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }
    
    
    
    // Creates and configures a UILabel with the specified text
    private func createLabel(_ text: String) -> UILabel {
        let res = UILabel()
        res.translatesAutoresizingMaskIntoConstraints = false// Disable autoresizing masks
        res.text = text
        res.numberOfLines = 0
        res.font = UIFont.systemFont(ofSize: 18)
        res.textColor = UIColor.black
        return res
    }
    
    // Creates and configures a UITextView with a default description
    private func createTextDescription() -> UITextView {
        let res = UITextView()
        res.translatesAutoresizingMaskIntoConstraints = false// Disable autoresizing masks
        res.layer.borderColor = UIColor.lightGray.cgColor
        res.layer.borderWidth = 0.5
        res.text = "I am coding now"
        res.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        res.font = UIFont.systemFont(ofSize: 17)
        res.backgroundColor = .white
        return res
    }
    
    // Set up the layout constraints for the UI elements
    private func setConstrains() {
        // Constraints for labelName
        NSLayoutConstraint.activate([
            labelName.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            labelName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10)
            ])
        // Constraints for labelLastName
        NSLayoutConstraint.activate([
            labelLastName.topAnchor.constraint(equalTo: labelName.topAnchor, constant: 45),
            labelLastName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10)
            ])
        // Constraints for fieldForName
        NSLayoutConstraint.activate([
            fieldForName.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            fieldForName.leftAnchor.constraint(equalTo: labelName.rightAnchor, constant: 5),
            fieldForName.centerYAnchor.constraint(equalTo: labelName.centerYAnchor),
            fieldForName.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -76)
            ])
        // Constraints for fieldForLastName
        NSLayoutConstraint.activate([
            fieldForLastName.leftAnchor.constraint(equalTo: labelLastName.rightAnchor, constant: 5),
            fieldForLastName.centerYAnchor.constraint(equalTo: labelLastName.centerYAnchor),
            fieldForLastName.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -110)
            ])
        // Constraints for labelDescription
        NSLayoutConstraint.activate([
            labelDescription.topAnchor.constraint(equalTo: labelLastName.bottomAnchor, constant: 30),
            labelDescription.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10)
            ])
        // Constraints for textDescription
        NSLayoutConstraint.activate([
            textDescription.topAnchor.constraint(equalTo: labelDescription.bottomAnchor, constant: 10),
            textDescription.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            textDescription.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            textDescription.heightAnchor.constraint(equalToConstant: 150)
            ])
        // Constraints for firstButton(save)
        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: textDescription.bottomAnchor, constant: 15),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        // Constraints for secondButton(print n users)
        NSLayoutConstraint.activate([
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 15),
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        }
    
}

