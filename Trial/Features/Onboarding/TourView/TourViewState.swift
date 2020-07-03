//
//  TourViewState.swift
//  Trial
//
//  Created by Milos on 6/26/20.
//

import Combine
import SwiftUI

enum IntroScreens: Hashable {
    case welcome
    case middle
    case final
}

class TourViewState: ObservableObject {
    @Published var activeTab: IntroScreens = .welcome
    @Published var backgroundColor = Color.pleasantBlue
    
    private var cancellable = Set<AnyCancellable>()
    
    private var backgroundColorPublisher: AnyPublisher<Color, Never> {
        self.$activeTab
            .map { tabType -> Color in
                switch tabType {
                case .welcome:
                    return Color.pleasantBlue
                case .middle:
                    return Color.pleasantGreen
                case .final:
                    return Color.pleasantRed
                }
            }
            .eraseToAnyPublisher()
    }
    
    init() {
        backgroundColorPublisher
            .assign(to: \.backgroundColor, on: self)
            .store(in: &cancellable)
    }
}
