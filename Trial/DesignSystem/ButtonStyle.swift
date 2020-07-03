//
//  ButtonStyle.swift
//  Trial
//
//  Created by Milos on 7/3/20.
//

import SwiftUI

struct BouncyButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
    }
}
