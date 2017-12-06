//
//  Concentration.swift
//  Concentration
//
//  Created by Kyle Yang on 12/5/17.
//  Copyright © 2017 phx. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    
    func chooseCard(at index: Int) {
        
        if !cards[index].isMatched {
            
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                cards[index].isFaceUp = true
                
                indexOfOneAndOnlyFaceUpCard = nil
            } else {

                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                
                cards[index].isFaceUp = true
                
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    

    init(numberOfPairsOfCards: Int) {
        
        for _ in 1 ... numberOfPairsOfCards {
            let card = Card()
            
            cards.append(card)
            cards.append(card)
        }
        
        // TODO: Shuffle cards
    }
    
    var indexOfOneAndOnlyFaceUpCard: Int?
}
