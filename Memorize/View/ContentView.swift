//
//  ContentView.swift
//  Memorize
//
//  Created by Junwei Li on 2023/7/3.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        
        VStack{
            VStack{
                Text(viewModel.chosenThemeName()).font(.largeTitle)
                Text("Score: \(viewModel.getScore())")
            }
            Spacer()
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(viewModel.cards) {card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.chooseCard(card)
                            }
                    }
                }
            }
            .foregroundColor(viewModel.chosenThemeColor())
            
            Button {
                viewModel.newGame()
            } label: {
                Text("New Game").font(.largeTitle)
            }

        }
        .padding(.horizontal)
    }
    
    
}

struct CardView: View {
    
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched{
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
    }
}
