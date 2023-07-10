//
//  MemoryGame.swift
//  Memorize
//
//  Created by Junwei Li on 2023/7/5.
//

import Foundation

struct MemoryGame<CardContent> where CardContent:Equatable {
    struct Card: Identifiable {
        let id = UUID()
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        var previousSeen = false
    }
    
    private(set) var cards: Array<Card>
    
    private var indexOfTheOnlyOneFacedUpCard:Int?
    
    private(set) var score = 0
    
    init(numberOfPairsOfCard: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCard{
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
        cards.shuffle()
    }
    
    mutating func chooseCard(_ chosenCard:Card){
        if let chosenIndex = cards.indices.first(where: { index in
            cards[index].id == chosenCard.id
        }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            // Only one card faced up
            if let indexOfFacedUpCard = indexOfTheOnlyOneFacedUpCard{
                //if match
                if cards[indexOfFacedUpCard].content == cards[chosenIndex].content{
                    cards[indexOfFacedUpCard].isMatched = true
                    cards[chosenIndex].isMatched = true
                    score+=2
                // Not macth
                } else {
                    if cards[indexOfFacedUpCard].previousSeen{
                        score-=1
                    }
                    if cards[chosenIndex].previousSeen{
                        score-=1
                    }
                }
                indexOfTheOnlyOneFacedUpCard = nil
                cards[chosenIndex].previousSeen = true
                cards[indexOfFacedUpCard].previousSeen = true
            // Two cards faceUP or Begin of game
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

struct Theme<CardContent> {
    let name: String
    var emojis: Array<CardContent>
    let numberOfPairCard: Int
    let color: String
}
