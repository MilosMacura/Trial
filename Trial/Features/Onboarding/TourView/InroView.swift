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

struct InroView_Previews: PreviewProvider {
    static var previews: some View {
        let text = "Intro View"
        let systemImage = "checkmark"
        return
            ZStack {
                Color.pleasantBlue
                    .edgesIgnoringSafeArea(.all)
                IntroView(text: text,
                          systemImage: systemImage)
            }
    }
}
