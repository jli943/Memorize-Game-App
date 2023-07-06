//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Junwei Li on 2023/7/5.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject{
    static var emojis = ["🚙", "🛴", "✈️", "🛵", "⛵️", "🚎", "🚐", "🚛",
                         "🛻", "🏎", "🚂", "🚊", "🚀", "🚁", "🚢", "🛶",
                         "🛥", "🚞", "🚤", "🚲", "🚡", "🚕", "🚟", "🚃"]
    
    static func createMemoryGame()->MemoryGame<String>{
        MemoryGame<String>(numberOfPairsOfCard: 4, createCardContent: { Index in
            emojis[Index]})
    }
    
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    func chooseCard(_ card: MemoryGame<String>.Card){
        model.chooseCard(card)
    }
    
    func chooseItem(){
        
    }
    
}
