//
//  Theme.swift
//  Memorize
//
//  Created by Poh Jie on 21/6/21.
//

import Foundation

struct Theme {
    var name: String
    var emojis: Array<String>
    var numPairOfCardsToShow: Int
    var color: String
    
    // Array of themes
    static var vehicles = Theme(name: "Vehicle", emojis: ["✈️", "🚗", "🚀", "🚘", "🚙", "🚎", "🚛", "🏎"],
                                numPairOfCardsToShow: 6, color: "orange")
    static var faces = Theme(name: "Face", emojis: ["😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣"],
                             numPairOfCardsToShow: 6, color: "blue")
    static var flags = Theme(name: "Flag", emojis: ["🇬🇧", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🇺🇸", "🏳️‍🌈", "🇫🇲", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🇸🇨", "🇩🇰"],
                             numPairOfCardsToShow: 7, color: "purple")
    
    static var themes = [vehicles, faces, flags]
}
