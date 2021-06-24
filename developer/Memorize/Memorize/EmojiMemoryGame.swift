//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Poh Jie on 3/6/21.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    var theme: Theme
    @Published private var model: MemoryGame<String>
    
    init() {
        self.theme = Theme.themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(self.theme)
    }

    static func createMemoryGame(_ theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards:
            theme.numPairOfCardsToShow <= theme.emojis.count
            ? theme.numPairOfCardsToShow : theme.emojis.count)
        {
            pairIndex in theme.emojis[pairIndex]
        }
    }
            
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    var color: Color {
        switch theme.color {
        case "orange": return Color.orange
        case "blue": return Color.blue
        case "purple": return Color.purple
        default: return Color.red
        }
    }
    
    var score: Int {
        return model.score
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func resetGame() {
        theme = Theme.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme)
    }
}
