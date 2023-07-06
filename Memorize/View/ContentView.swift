//
//  ContentView.swift
//  Memorize
//
//  Created by Junwei Li on 2023/7/3.
//

import SwiftUI

struct ContentView: View {
    //    let vehicleEmojis = ["🚙", "🛴", "✈️", "🛵", "⛵️", "🚎", "🚐", "🚛",
    //                         "🛻", "🏎", "🚂", "🚊", "🚀", "🚁", "🚢", "🛶",
    //                         "🛥", "🚞", "🚤", "🚲", "🚡", "🚕", "🚟", "🚃"]
    //
    //    let animalEmojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼"]
    //
    //    let foodEmojis = ["🍔", "🥐", "🍕", "🥗", "🥟", "🍣", "🍪", "🍚",
    //                      "🍝", "🥙", "🍭", "🍤", "🥞", "🍦", "🍛", "🍗"]
    //
    //    @State var emojis = ["🚙", "🛴", "✈️", "🛵", "⛵️", "🚎", "🚐", "🚛",
    //                         "🛻", "🏎", "🚂", "🚊", "🚀", "🚁", "🚢", "🛶",
    //                         "🛥", "🚞", "🚤", "🚲", "🚡", "🚕", "🚟", "🚃"]
    //
    //    @State var emojisCount = 5
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
//        var vehcileButton: some View {
//            Button {
//                viewModel.chooseItem()
//            } label: {
//                VStack{
//                    Image(systemName: "car")
//                        .font(.largeTitle)
//                    Text("Vehicle")
//                        .font(.footnote)
//                }
//            }
//        }
    
//        var foodButton: some View {
//            Button {
//                emojis = foodEmojis.shuffled()
//                emojisCount = emojis.count
//            } label: {
//                VStack{
//                    Image(systemName: "bag")
//                        .font(.largeTitle)
//                    Text("Food")
//                        .font(.footnote)
//                }
//            }
//        }
//
//        var animalButton: some View {
//            Button {
//                emojis = animalEmojis.shuffled()
//                emojisCount = emojis.count
//            } label: {
//                VStack{
//                    Image(systemName: "hare")
//                        .font(.largeTitle)
//                    Text("Animal")
//                        .font(.footnote)
//                }
//            }
//        }
    
    var body: some View {
        
        VStack{
            Text("Memorize!").font(.largeTitle)
            Spacer()
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) {card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.chooseCard(card)
                            }
                    }
                }
            }
            .foregroundColor(.yellow)
            Spacer()
            HStack{
//                                Spacer()
//                                vehcileButton
//                                Spacer()
//                                foodButton
//                                Spacer()
//                                animalButton
//                                Spacer()
            }
            .padding(.top)
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
