//
//  LoadingView.swift
//  Trial
//
//  Created by Milos on 7/3/20.
//

import SwiftUI

struct LoadingView: View {
    @State private var downloadAmount = 0.0
    var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        ProgressView("Loading your transactions from a json at random time so this might take a while...", value: downloadAmount, total: 100.0)
            .onReceive(timer) { _ in
                if downloadAmount < 100 {
                    downloadAmount += 2
                } else {
                    self.timer.upstream.connect().cancel()
                }
            }
            .onAppear {
                self.downloadAmount = 0
            }
            .padding()
    }
}
