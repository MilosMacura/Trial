//
//  TourViewInteractor.swift
//  Trial
//
//  Created by Milos on 6/27/20.
//

import Foundation

protocol TourViewInteractable {
    func skipIntro()
}

class TourViewInteractor: TourViewInteractable {
    func skipIntro() {
        print("skip intro")
    }
}
