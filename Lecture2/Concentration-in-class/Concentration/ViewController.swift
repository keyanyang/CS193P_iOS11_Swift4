//
//  ViewController.swift
//  Concentration
//
//  Created by Kyle Yang on 12/5/17.
//  Copyright © 2017 phx. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1)/2)
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            
            updateViewFromModel()
        }
        else {
            print("Warning! The chosen card was not in cardButtons")
        }
    }
    
    
    func updateViewFromModel() {
        
        for index in cardButtons.indices {
            let button = cardButtons[index]
            
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            else {
                button.setTitle("", for: .normal)
                
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["🐶","🐱", "🐭","🐹","🐰","🦊","🐻","🐼","🐨","🐯","🦁","🐮", "🐷"]
    
    var emoji = [Int: String]()
    
    func emoji(for card: Card) -> String {
        
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            
            emoji[card.identifier] = emojiChoices[randomIndex]
            
            emojiChoices.remove(at: randomIndex)
        }
        
        return emoji[card.identifier] ?? "?"
    }
    
    private var flipCount = 0  {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    

}
