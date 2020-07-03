//
//  TrialApp.swift
//  Trial
//
//  Created by Milos on 6/26/20.
//

import SwiftUI

@main
struct TrialApp: App {
    var body: some Scene {
        WindowGroup {
            let state = RootViewState()
            let interactor = RootViewInteractor(state: state)
            RootView(state: state, interactor: interactor)
        }
    }
}
