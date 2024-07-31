//
//  User.swift
//  ToDoList
//
//  Created by berke on 23.07.2024.
//

import Foundation
 
struct User: Codable{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
