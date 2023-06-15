//
//  DataStorage.swift
//  MyProject
//
//  Created by Саша Восколович on 15.06.2023.
//


// This is a class for storing and accessing data
class DataStorage {
    
    static let shared = DataStorage()// Singleton instance of DataStorage
    
    var users: [UserInfo] = []// Array to store user information
    
    private init() {}// Private initializer to enforce singleton pattern
}


// MARK: - User Information

// This struct represents user information
struct UserInfo {
      var name: String?
      var lastName: String?
      var description: String?
      
}
