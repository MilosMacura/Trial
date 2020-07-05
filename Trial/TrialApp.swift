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
            let state = AppState()
            let interactor = AppInteractor(state: state)
            AppView(state: state, interactor: interactor)
        }
    }
}
