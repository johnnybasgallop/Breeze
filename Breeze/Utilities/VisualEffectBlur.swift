//
//  VisualEffectBlur.swift
//  Breeze
//
//  Created by johnny basgallop on 18/10/2024.
//

import Foundation
import SwiftUI

// A wrapper for NSVisualEffectView to use in SwiftUI
struct VisualEffectBlurView: NSViewRepresentable {
    func makeNSView(context: Context) -> NSVisualEffectView {
        let view = NSVisualEffectView()
        view.material = .hudWindow // Change to .sidebar, .dark, etc., for different effects
        view.blendingMode = .behindWindow // Blurs content behind the window
        view.state = .active
        return view
    }
    
    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {}
}
