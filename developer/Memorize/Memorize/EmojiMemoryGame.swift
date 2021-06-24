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
        self.theme = Theme.themes.randomElement() ?? Theme.faces
        model = EmojiMemoryGame.createMemoryGame(theme)
    }

    static func createMemoryGame(_ theme: Theme) -> MemoryGame<String> {
//        MemoryGame<String>(numberOfPairsOfCards: theme.numPairOfCardsToShow) { pairIndex in
//            theme.emojis[pairIndex]
//        }
        MemoryGame<String>(numberOfPairsOfCards:
            theme.numPairOfCardsToShow <= theme.emojis.count
            ? theme.numPairOfCardsToShow : theme.emojis.count) { pairIndex in
            Array(Set(theme.emojis))[pairIndex]
        }
    }
    
    // @Published private var model: MemoryGame<String> = createMemoryGame(theme)
        
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    var color: Color {
        // print(Color(EmojiMemoryGame.theme.color))
        switch theme.color {
            case "orange": return Color.orange
            default: return Color.red
        }
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    

}
