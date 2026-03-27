//
//  Service.swift
//  CipherVault
//
//  Created by Cristian Sánchez Pineda on 21/03/26.
//

import Foundation

protocol AccessService {
    
    func getDocument(title: String, userName: String) -> Document
    
}
