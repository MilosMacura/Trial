//
//  TrialUITests.swift
//  TrialUITests
//
//  Created by Milos on 6/26/20.
//

import XCTest

// swiftlint:disable implicitly_unwrapped_optional

class TourUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments += ["-firstRun", "YES"]
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testTourAndButton() throws {
        let tabs = app.collectionViews.cells.children(matching: .other).element.children(matching: .other).element
        tabs.swipeLeft()
        tabs.swipeLeft()
        app.buttons["chevron.right.2"].tap()
        
        checkIfSuccessOrFailScreenIsDisplayed()
    }
    
    func testTourOutOfBounds() throws {
        let tabs = app.collectionViews.cells.children(matching: .other).element.children(matching: .other).element
        tabs.swipeLeft()
        tabs.swipeRight()
        tabs.swipeRight()
        tabs.swipeLeft()
        tabs.swipeLeft()
        tabs.swipeLeft()
        app.buttons["chevron.right.2"].tap()
        
        checkIfSuccessOrFailScreenIsDisplayed()
    }
    
    func testTourInstantButtonPress() throws {
        app.buttons["chevron.right.2"].tap()
        
        checkIfSuccessOrFailScreenIsDisplayed()
    }
    
    func checkIfSuccessOrFailScreenIsDisplayed() {
        
        let loadingText = app.staticTexts["Loading your transactions from a json at random time so this might take a while..."]
        let failureText = app.staticTexts["The odds are against you, something went wrong."]
        XCTAssert(loadingText.exists || failureText.exists)
    }
}
