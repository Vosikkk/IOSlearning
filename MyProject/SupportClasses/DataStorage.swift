//
//  DataStorage.swift
//  MyProject
//
//  Created by Саша Восколович on 15.06.2023.
//

import Foundation


// This is a class for storing and accessing data
class DataStorage {
    
    static let shared = DataStorage()// Singleton instance of DataStorage
    
    private let userDefaults = UserDefaults.standard// UserDefaults instance for data storage
    private let usersKey = "users"// Key used for saving/retrieving users
    
    var users: [UserInfo] {
        get {
            // Retrieve data from UserDefaults
            if let data = userDefaults.data(forKey: usersKey),
               let users = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [UserInfo] {
                return users
            }
            return []// Return an empty array if no users are found
        }
        set {
            // Archive the new value and save it to UserDefaults
            if let data = try? NSKeyedArchiver.archivedData(withRootObject: newValue, requiringSecureCoding: false) {
                userDefaults.set(data, forKey: usersKey)
            }
        }
    }
    
    func saveUsers(infoOfUser : UserInfo) {
        users.append(infoOfUser)// Add a new user to the array
    }
    
    private init() {}// Private initializer to enforce singleton pattern
}


// MARK: - User Information


class UserInfo: NSObject, NSCoding {
    
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
        let name = aDecoder.decodeObject(forKey:"name") as? String
        let lastName = aDecoder.decodeObject(forKey: "lastName") as? String
        let descriptionInfo = aDecoder.decodeObject(forKey: "description") as? String
        self.init(name: name, lastName: lastName, descriptionInfo: descriptionInfo)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(lastName, forKey: "lastName" )
        aCoder.encode(descriptionInfo, forKey: "description")
    }
    
}

