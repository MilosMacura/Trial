//
//  SplashView.swift
//  Trial
//
//  Created by Milos on 6/26/20.
//

import SwiftUI

struct TourView: View {
    @ObservedObject private var state: SplashViewState
    private var interactor: SplashViewInteractable
    private var rootInteractor: RootViewInteractable
    
    init(state: SplashViewState,
         interactor: SplashViewInteractable,
         rootViewInteractor: RootViewInteractable) {
        
        self.state = state
        self.interactor = interactor
        self.rootInteractor = rootViewInteractor
    }
    
    var body: some View {
        
        ZStack {
            state.backgroundColor
                .animation(.default)
                .edgesIgnoringSafeArea(.all)
            
            TabView(selection: $state.activeTab) {
                IntroView(text: "Welcome to the Trial App.",
                          systemImage: "hourglass.tophalf.fill")
                    .tag(IntroScreens.welcome)
                IntroView(text: "This tutorial is really short.",
                          systemImage: "hourglass")
                    .tag(IntroScreens.middle)
                IntroView(text: "Thank you for your attention.",
                          systemImage: "hourglass.bottomhalf.fill")
                    .tag(IntroScreens.final)
            }
            .tabViewStyle(PageTabViewStyle())
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        rootInteractor.showTransactionList()
                    }) {
                    Image(systemName: "chevron.right.2")
                        .foregroundColor(.white)
                        .padding()
                    }
                }
                Spacer()
            }
        }
    }
}

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

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        let state = SplashViewState()
        let interactor = SplashViewInteractor()
        let rootState = RootViewState()
        let rootInteractor = RootViewInteractor(state: rootState)
        return TourView(state: state,
                        interactor: interactor,
                        rootViewInteractor: rootInteractor)
    }
}
