//
//  TriangleTests.swift
//  QuiddityTests
//
//  Created by David Crooks on 17/01/2019.
//  Copyright © 2019 David Crooks. All rights reserved.
//

import XCTest
@testable import Quiddity

class TriangleTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInside() {
        let triangle = Triangle(A: Vec2.zero, B: Vec2(x:0.0,y:1.0), C: Vec2(x:2.0,y:0.0))
        
        let outside1 =  Vec2(x:-0.5,y:1.0)
        let outside2 =  Vec2(x:1.0,y:0.75)
        let inside = Vec2(x:0.3,y:0.2)
        
        XCTAssert(triangle.contains(point: inside), "Point \(inside) should be inside \(triangle)")
        XCTAssertFalse(triangle.contains(point: outside1), "Point \(outside1) should be outside \(triangle)")
        XCTAssertFalse(triangle.contains(point: outside2), "Point \(outside2) should be outside \(triangle)")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
