//
//  RootViewState.swift
//  Trial
//
//  Created by Milos on 6/28/20.
//

import SwiftUI

enum ScreenName {
    case tourView
    case transactionScreen
}

class AppState: ObservableObject {
    @AppStorage("firstRun") var isFirstRun: Bool = true
    @Published var activeViewType: ScreenName = .tourView
}
