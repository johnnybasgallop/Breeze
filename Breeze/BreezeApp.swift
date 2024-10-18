//
//  BreezeApp.swift
//  Breeze
//
//  Created by johnny basgallop on 18/10/2024.
//

import SwiftUI
import Foundation

let screenwidth = NSScreen.main?.visibleFrame.size.width
let screenHeight = NSScreen.main?.visibleFrame.size.height

@main
struct BreezeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView( ListCategories: [ListCategory.example(generalTitle: "General Chores", fakeJobName: "Take out the bins"), ListCategory.example(generalTitle: "Homework", fakeJobName: "Begin studying for AP final")])
                .frame(minWidth: 650, maxWidth: 1000, minHeight: 500, maxHeight: screenHeight != nil ? screenHeight! - 20 : 900)
        }
        .defaultSize(width: 400, height: 400)
        .windowResizability(.contentSize)
    }
}




