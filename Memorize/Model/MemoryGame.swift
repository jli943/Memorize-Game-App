//
//  MemoryGame.swift
//  Memorize
//
//  Created by Junwei Li on 2023/7/5.
//

import Foundation

struct MemoryGame<CardContent> {
    struct Card: Identifiable {
        let id = UUID()
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
    }
    
    private(set) var cards: Array<Card>
    
    private var indexOfTheOnlyOneFacedUpCard:Int?
    
    init(numberOfPairsOfCard: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCard{
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    mutating func chooseCard(_ chosenCard:Card) where CardContent:Equatable{
        if let chosenIndex = cards.indices.first(where: { index in
            cards[index].id == chosenCard.id
        }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let indexOfFacedUpCard = indexOfTheOnlyOneFacedUpCard{
                if cards[indexOfFacedUpCard].content == cards[chosenIndex].content{
                    cards[indexOfFacedUpCard].isMatched = true
                    cards[chosenIndex].isMatched = true
                }
                indexOfTheOnlyOneFacedUpCard = nil
            } else {
                for index in cards.indices{
                    cards[index].isFaceUp = false
                }
                indexOfTheOnlyOneFacedUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp = true
        }
        
        
    }
    
    
}
