//
//  CardView.swift
//  Memorize
//
//  Created by Junwei Li on 2023/7/3.
//

import SwiftUI

struct CardView: View {
    
    var content: String
    
    @State var isFaceUp = true
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        ZStack{
            if isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
            
            
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(content: "🫦")
    }
}
