//
//  Agent.swift
//  CipherVault
//
//  Created by Cristian Sánchez Pineda on 21/03/26.
//

import Foundation

class Agent {
    var password: String
    var name: String
    var clearanceLevel: Int
    
    init(password: String, name: String, clearanceLevel: Int) {
        self.password = password
        self.name = name
        self.clearanceLevel = clearanceLevel
    }
}
