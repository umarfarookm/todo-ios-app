//
//  User.swift
//  TODO-List
//
//  Created by Apple on 10/08/23.
//

import Foundation

struct User: Codable{
    let id: String
    let name: String
    let email: String
    let joinedDate: TimeInterval
    
}
