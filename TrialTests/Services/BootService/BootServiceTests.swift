//
//  BootServiceTests.swift
//  TrialTests
//
//  Created by Milos on 6/26/20.
//

import SwiftUI
@testable import Trial
import XCTest

// swiftlint:disable implicitly_unwrapped_optional

class BootServiceTests: XCTestCase {

    var bootService: Bootable!
    
    override func setUpWithError() throws {
        self.bootService = BootService()
    }

    override func tearDownWithError() throws {
        self.bootService = BootService()
    }

    func testBootView() {
        
        @AppStorage let firstBoot
        bootService.bootView()
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
