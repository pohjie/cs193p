//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Poh Jie on 3/6/21.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🇬🇧", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🇺🇸", "🏳️‍🌈",
                  "🇫🇲", "🇸🇨", "🇩🇰", "🇦🇪"]

    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
                    emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
        
    
    var cards: Array<Card> {
        return model.cards
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
