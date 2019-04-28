//
//  PolygonTests.swift
//  QuiddityTests
//
//  Created by David Crooks on 27/04/2019.
//  Copyright © 2019 David Crooks. All rights reserved.
//

import XCTest
@testable import Quiddity

class PolygonTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testEquatable(){
        let vertices = [Vec2(x: 1,y: 1),Vec2(x: 1,y: -1),Vec2(x: -1,y: -1),Vec2(x: -1,y: 1)]
        
        let poly1 = Polygon(verticies: vertices)
        let poly2 = Polygon(verticies: permute(vertices,by: 1))
        let poly3 = Polygon(verticies:  [Vec2(x: 1,y: 1),Vec2(x: 1,y: -1),Vec2(x: -1,y: -1),Vec2(x: -1,y: 1.1)])
        
        XCTAssertTrue( poly1 == poly2 ,  "These two polygons are the same")
        XCTAssertFalse( poly1 == poly3 ,  "These two polygons are not the same")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
