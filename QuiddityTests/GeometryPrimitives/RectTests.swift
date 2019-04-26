//
//  RectTests.swift
//  QuiddityTests
//
//  Created by David Crooks on 26/04/2019.
//  Copyright © 2019 David Crooks. All rights reserved.
//

import XCTest
@testable import Quiddity

class RectTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testArea() {
        let rect = Rect(center: Vec2(x: 0, y: 0), width: 5, height: 5)
        XCTAssertEqual(rect.area, 25)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
