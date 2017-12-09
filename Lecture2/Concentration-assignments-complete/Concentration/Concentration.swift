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
    
    var touchScore = 0
    
    func chooseCard(at index: Int) {
        
        if !cards[index].isMatched {
            
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    touchScore += 2
                } else if isSeenFaceUpCard! || cards[index].isSeen {
                    touchScore -= 1
                }
                
                cards[index].isFaceUp = true
                
                indexOfOneAndOnlyFaceUpCard = nil
                
                cards[index].isSeen = true
            } else {

                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                
                cards[index].isFaceUp = true
                
                isSeenFaceUpCard = cards[index].isSeen
                
                indexOfOneAndOnlyFaceUpCard = index
                
                cards[index].isSeen = true
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
        for carIndex in cards.indices{
            let tmpId = cards[carIndex].identifier
            let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
            cards[carIndex].identifier = cards[randomIndex].identifier
            cards[randomIndex].identifier = tmpId
        }
    }
    
    var isSeenFaceUpCard: Bool?
    var indexOfOneAndOnlyFaceUpCard: Int?
}
