//
//  AFL4_GamesPopularApp.swift
//  AFL4-GamesPopular
//
//  Created by Macbook Pro on 24/05/22.
//

import SwiftUI

@main
struct AFL4_GamesPopularApp: App {
    @StateObject private var viewmodel = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewmodel)
        }
    }
}
