//
//  User.swift
//  planner for me
//
//  Created by Sebastian Schmeil on 24/10/2023.
//

import Foundation

struct User: Codable{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
