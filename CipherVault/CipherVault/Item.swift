//
//  Item.swift
//  CipherVault
//
//  Created by Cristian Sánchez Pineda on 21/03/26.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
