//
//  DataStorage.swift
//  MyProject
//
//  Created by Саша Восколович on 15.06.2023.
//

import Foundation



// Our keys for cache objects(user info)
struct Keys {
    static let nameKey = "name"
    static let lastNameKey = "lastName"
    static let descriptionKey = "description"
    static let usersKey = "users"
    
}

// This is a class for storing and accessing data
class DataStorage {
    
    static let shared = DataStorage()// Singleton instance of DataStorage
    
    private let userDefaults = UserDefaults.standard// UserDefaults instance for data storage
    var users: [User] {
        get {
            // Retrieve data from UserDefaults
            if let data = userDefaults.value(forKey: Keys.usersKey) as? Data {
                return try! PropertyListDecoder().decode([User].self, from: data)
            } else {
                return [User]()
            }
        }

        set {
            // Archive the new value and save it to UserDefaults
            if let data = try? PropertyListEncoder().encode(newValue) {
                userDefaults.set(data, forKey: Keys.usersKey)
            }
        }
    }

    func saveUsers(user: User) {
        users.append(user)// Add a new user to the array
    }
    
    private init() {}// Private initializer to enforce singleton pattern
}


// MARK: - User Information

class User: Codable {
    
    var name: String?
    var lastName: String?
    var descriptionInfo: String?
    
    // MARK: - Initialization
    init(name: String?, lastName: String?, descriptionInfo: String?) {
        self.name = name
        self.lastName = lastName
        self.descriptionInfo = descriptionInfo
    }
}

   
    
