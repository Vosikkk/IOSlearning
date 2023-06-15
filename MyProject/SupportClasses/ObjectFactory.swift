//
//  ObjectFactory.swift
//  MyProject
//
//  Created by Саша Восколович on 11.06.2023.
//
//  This class provides static methods to create UI objects such as labels, text fields, text views, and buttons.
//  Each method returns an instance of the corresponding UI object with predefined properties

import UIKit

class ObjectsFactory {
    
    
    // The createLabel(text:fontSize:) method creates a UILabel with the specified text and font size.
    static func createLabel(text: String, fontSize: CGFloat ) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.textColor = .textColor
        return label
    }
    
    // The createTextField(placeholder:) method creates a UITextField with rounded rectangular style, border width and color, and other customizations.
    static func createTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 7
        textField.layer.borderColor = UIColor.borderColorForFields.cgColor
        textField.contentVerticalAlignment = .center
        textField.textAlignment = .left
        textField.placeholder = placeholder
        return textField
    }
    
    // The createTextView() method creates a UITextView with border color, border width, initial text, font size, and background color settings
    static func createTextView() -> UITextView {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.borderColor = UIColor.borderColorForFields.cgColor
        textView.layer.borderWidth = 0.5
        textView.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        textView.font = UIFont.systemFont(ofSize: 17)
        textView.backgroundColor = .backGroundFiledsColor
        return textView
    }
    
    // The createButton(title:) method creates a UIButton with system type, background color, title, tint color, and font settings
    static func createButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .backGroundButtonColor
        button.setTitle(title, for: .normal)
        button.tintColor = .buttonTinColor
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }
         
}
