//
//  ContentView.swift
//  Memorize
//
//  Created by Junwei Li on 2023/7/3.
//

import SwiftUI

struct ContentView: View {
    let vehicleEmojis = ["🚙", "🛴", "✈️", "🛵", "⛵️", "🚎", "🚐", "🚛",
                         "🛻", "🏎", "🚂", "🚊", "🚀", "🚁", "🚢", "🛶",
                         "🛥", "🚞", "🚤", "🚲", "🚡", "🚕", "🚟", "🚃"]
    
    let animalEmojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼"]
    
    let foodEmojis = ["🍔", "🥐", "🍕", "🥗", "🥟", "🍣", "🍪", "🍚",
                      "🍝", "🥙", "🍭", "🍤", "🥞", "🍦", "🍛", "🍗"]
    
    @State var emojis = ["🚙", "🛴", "✈️", "🛵", "⛵️", "🚎", "🚐", "🚛",
                         "🛻", "🏎", "🚂", "🚊", "🚀", "🚁", "🚢", "🛶",
                         "🛥", "🚞", "🚤", "🚲", "🚡", "🚕", "🚟", "🚃"]
    
    @State var emojisCount = 5
    
    var vehcileButton: some View {
        Button {
            emojis = vehicleEmojis.shuffled()
            emojisCount = emojis.count
        } label: {
            VStack{
                Image(systemName: "car")
                    .font(.largeTitle)
                Text("Vehicle")
                    .font(.footnote)
            }
        }
    }
    
    var foodButton: some View {
        Button {
            emojis = foodEmojis.shuffled()
            emojisCount = emojis.count
        } label: {
            VStack{
                Image(systemName: "bag")
                    .font(.largeTitle)
                Text("Food")
                    .font(.footnote)
            }
        }
    }
    
    var animalButton: some View {
        Button {
            emojis = animalEmojis.shuffled()
            emojisCount = emojis.count
        } label: {
            VStack{
                Image(systemName: "hare")
                    .font(.largeTitle)
                Text("Animal")
                    .font(.footnote)
            }
        }
    }
    
    
    var body: some View {
        
        VStack{
            Text("Memorize!").font(.largeTitle)
            Spacer()
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(emojis[..<emojisCount], id: \.self) {emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.yellow)
            Spacer()
            HStack{
                Spacer()
                vehcileButton
                Spacer()
                foodButton
                Spacer()
                animalButton
                Spacer()
            }
            .padding(.top)
        }
        .padding(.horizontal)
    }
    
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
