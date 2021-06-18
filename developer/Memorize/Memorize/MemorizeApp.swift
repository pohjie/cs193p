//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Poh Jie on 27/5/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
