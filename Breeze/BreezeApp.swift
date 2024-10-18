//
//  BreezeApp.swift
//  Breeze
//
//  Created by johnny basgallop on 18/10/2024.
//

import SwiftUI

@main
struct BreezeApp: App {
    var body: some Scene {
        WindowGroup {
                ContentView()
                    .frame(minWidth: 100, maxWidth: 400, minHeight: 100, maxHeight: 400)
            }
            .defaultSize(width: 400, height: 400)
            .windowResizability(.contentSize)
    }
}


