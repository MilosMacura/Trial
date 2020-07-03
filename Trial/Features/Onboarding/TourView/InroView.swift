//
//  InroView.swift
//  Trial
//
//  Created by Milos on 7/3/20.
//

import SwiftUI

struct IntroView: View {
    let text: String
    let systemImage: String
    var body: some View {
        VStack {
            Text(text)
                .font(.title)
                .foregroundColor(.white)
            Image(systemName: systemImage)
                .font(.title)
                .foregroundColor(.white)
        }
    }
}
