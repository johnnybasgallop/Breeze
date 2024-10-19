//
//  NoBackgroundButtonStyle.swift
//  Breeze
//
//  Created by johnny basgallop on 19/10/2024.
//

import Foundation
import SwiftUI

struct NoBackgroundButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
    }
}
