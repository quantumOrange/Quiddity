//
//  QuadTests.swift
//  QuiddityTests
//
//  Created by David Crooks on 26/04/2019.
//  Copyright © 2019 David Crooks. All rights reserved.
//

import XCTest
@testable import Quiddity

class QuadTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testContainsPoints() {
        let quad = Quad(a: Vec2.zero, b: Vec2(x: 2,y: 0.2), c: Vec2(x: 2,y: 2), d: Vec2(x: 0.2,y: 2))
        
        let out1 = Vec2(x: 2,y: 0)
        let out2 = Vec2(x: 3,y: 4)
        let out3 = Vec2(x: -3,y: -4)
        
        let inside1 = Vec2(x: 1.1,y: 1.2)
        let inside2 = Vec2(x: 0.3,y: 0.4)
        
        XCTAssertTrue(quad.containsPoint(inside1))
        XCTAssertTrue(quad.containsPoint(inside2))
        
        XCTAssertFalse(quad.containsPoint(out1))
        XCTAssertFalse(quad.containsPoint(out2))
        XCTAssertFalse(quad.containsPoint(out3))
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
