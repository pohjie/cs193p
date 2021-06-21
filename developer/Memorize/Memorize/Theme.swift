//
//  Theme.swift
//  Memorize
//
//  Created by Poh Jie on 21/6/21.
//

import Foundation

struct Theme {
    let name: String
    let emojis: Array<String>
    let numPairOfCardsToShow: Int
    let color: String
    
    init() {
        name = "Vehicle"
        emojis = ["✈️", "🚗", "🚀", "🚘", "🚙", "🚎", "🚛", "🏎"]
        numPairOfCardsToShow = 9
        color = "orange"
    }
}
