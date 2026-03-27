//
//  Document.swift
//  CipherVault
//
//  Created by Cristian Sánchez Pineda on 21/03/26.
//


import Foundation

class Document {
    
    var title: String
    var content: String
    var requiredLevel: Int
    
    init(title: String, content: String, requiredLevel: Int) {
        self.title = title
        self.content = content
        self.requiredLevel = requiredLevel
    }
}
