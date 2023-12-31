//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Junwei Li on 2023/7/3.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
