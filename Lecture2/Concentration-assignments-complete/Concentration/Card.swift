//
//  Card.swift
//  Concentration
//
//  Created by Kyle Yang on 12/5/17.
//  Copyright © 2017 phx. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    
    var isMatched = false
    
    var isSeen = false
    
    var identifier: Int
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        Card.identifierFactory += 1
        return Card.identifierFactory
    }
    
}
