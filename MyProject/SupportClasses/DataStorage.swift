//
//  DataStorage.swift
//  MyProject
//
//  Created by Саша Восколович on 15.06.2023.
//

import Foundation


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
            if let data = userDefaults.data(forKey: Keys.usersKey),
               let users = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [User] {
                return users
            }
            return []// Return an empty array if no users are found
        }
        set {
            // Archive the new value and save it to UserDefaults
            if let data = try? NSKeyedArchiver.archivedData(withRootObject: newValue, requiringSecureCoding: false) {
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


class User: NSObject, NSCoding {
    
    var name: String?
    var lastName: String?
    var descriptionInfo: String?
    
    // MARK: - Initialization
    init(name: String?, lastName: String?, descriptionInfo: String?) {
        self.name = name
        self.lastName = lastName
        self.descriptionInfo = descriptionInfo
    }
    
    // MARK: - NSCoding
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: Keys.nameKey) as? String
        let lastName = aDecoder.decodeObject(forKey: Keys.lastNameKey) as? String
        let descriptionInfo = aDecoder.decodeObject(forKey: Keys.descriptionKey) as? String
        self.init(name: name, lastName: lastName, descriptionInfo: descriptionInfo)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: Keys.nameKey)
        aCoder.encode(lastName, forKey: Keys.lastNameKey)
        aCoder.encode(descriptionInfo, forKey: Keys.descriptionKey)
    }
    
}

