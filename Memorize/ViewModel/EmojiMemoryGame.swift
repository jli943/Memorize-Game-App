//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Junwei Li on 2023/7/5.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject{
    static private var vehicleEmojis = ["🚗", "🛴", "✈️", "🛵", "⛵️", "🚎", "🚐", "🚛", "🛻", "🏎", "🚂", "🚊", "🚀", "🚁", "🚢", "🛶", "🛥", "🚞", "🚟", "🚃"]
    static private var animalEmojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐵"]
    static private var foodEmojis = ["🍔", "🥐", "🍕", "🥗", "🥟", "🍣", "🍪", "🍚", "🍝", "🥙", "🍭", "🍤", "🥞", "🍦", "🍛", "🍗"]
    static private var heartEmojis = ["❤️", "🧡", "💛", "💚", "💙", "💜"]
    static private var sportsEmojis = ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏉", "🥏", "🏐", "🎱", "🏓", "🏸", "🏒", "🥊", "🚴‍♂️", "🏊", "🧗‍♀️", "🤺", "🏇", "🏋️‍♀️", "⛸", "⛷", "🏄", "🤼"]
    static private var weatherEmojis = ["☀️", "🌪", "☁️", "☔️", "❄️"]
    
    static private let colors = ["black", "gray", "red", "green"]
    
    static private func getColor(color:String) -> Color{
        switch color{
        case "black":
            return .black
        case "gray":
            return .gray
        case "red":
            return .red
        case "green":
            return .green
        default:
            return .white
        }
    }
    
    static func createTheme(_ name:String, _ emojis:Array<String>, _ numberOfPairCard: Int)->Theme<String>{
        let color = colors.randomElement()!
        var defaultNumberOfPair = numberOfPairCard
        if numberOfPairCard > emojis.count{
            defaultNumberOfPair = emojis.count
        }
        return Theme(name: name, emojis: emojis.shuffled(), numberOfPairCard: defaultNumberOfPair, color: color)
    }
    
    static private var themes:Array<Theme<String>>{
        var themes = Array<Theme<String>>()
        let defaultPairsOfCards = 8
        themes.append(createTheme("Vehicles", vehicleEmojis, defaultPairsOfCards))
        themes.append(createTheme("Animals", animalEmojis, defaultPairsOfCards))
        themes.append(createTheme("Food", foodEmojis, defaultPairsOfCards))
        themes.append(createTheme("Hearts", heartEmojis, defaultPairsOfCards))
        themes.append(createTheme("Sports", sportsEmojis, defaultPairsOfCards))
        themes.append(createTheme("Weather", weatherEmojis, defaultPairsOfCards))
        return themes
    }
    
    static func chooseTheme(themes: Array<Theme<String>>)->Theme<String>?{
        if let chosenTheme = themes.randomElement(){
            return chosenTheme
        }
        return nil
    }
    
    static func createMemoryGame(theme: Theme<String>)->MemoryGame<String>{
        MemoryGame<String>(numberOfPairsOfCard: theme.numberOfPairCard, createCardContent: { Index in
            theme.emojis[Index]})
    }
    
    // Set two models from Model
    private var chosenTheme: Theme<String>
    @Published private var model: MemoryGame<String>
    
    init(){
        chosenTheme = EmojiMemoryGame.chooseTheme(themes: EmojiMemoryGame.themes)!
        model = EmojiMemoryGame.createMemoryGame(theme: chosenTheme)
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    func chooseCard(_ card: MemoryGame<String>.Card){
        model.chooseCard(card)
    }
    
    func chosenThemeName()->String{
        chosenTheme.name
    }
    
    func chosenThemeColor()->Color{
        EmojiMemoryGame.getColor(color: chosenTheme.color)
    }
    
    func newGame(){
        chosenTheme = EmojiMemoryGame.chooseTheme(themes: EmojiMemoryGame.themes)!
        model = EmojiMemoryGame.createMemoryGame(theme: chosenTheme)
    }
    
    func getScore() -> Int{
        model.score
    }
}
