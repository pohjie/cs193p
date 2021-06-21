//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Poh Jie on 3/6/21.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
//    static let emojis = ["🇬🇧", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🇺🇸", "🏳️‍🌈",
//                  "🇫🇲", "🇸🇨", "🇩🇰", "🇦🇪"]
    
    static let theme = Theme()

    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.numPairOfCardsToShow) { pairIndex in
            theme.emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
        
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    var color: Color {
        // print(Color(EmojiMemoryGame.theme.color))
        switch EmojiMemoryGame.theme.color {
            case "orange": return Color.orange
            default: return Color.red
        }
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
