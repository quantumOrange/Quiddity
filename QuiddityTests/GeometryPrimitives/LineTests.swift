//
//  TestLines.swift
//  QuiddityTests
//
//  Created by David Crooks on 17/01/2019.
//  Copyright © 2019 David Crooks. All rights reserved.
//

import XCTest
@testable import Quiddity

class LineTests: XCTestCase {
    let tolerance = 0.00001
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIntersection() {
        let p = Line(start:Vec2(x: -1.0, y: 1.0),end:Vec2(x: 1.0, y: -1.0))
        let q = Line(start:Vec2(x: -1.0, y: 0.0),end:Vec2(x: 1.0, y: 0.0))
      
        let intersectionPQ = p.intersect(with:q)
        XCTAssertNotNil(intersectionPQ, "P and Q should intersect")
        
        if let v = intersectionPQ {
            XCTAssertEqual(v.x, 0.0, accuracy: tolerance, "P and Q should intesect at the origin")
            XCTAssertEqual(v.y, 0.0, accuracy: tolerance, "P and Q should intesect at the origin")
        }
    }
    
    func testNonIntersection() {
        let p = Line(start:Vec2(x: -1.0, y: 0.0),end:Vec2(x: 1.0, y: 1.0))
        let q = Line(start:Vec2(x: 0.0, y: -1.0),end:Vec2(x: 1.0, y: 0.0))
       
        let intersectionPQ = p.intersect(with:q)
        XCTAssertNil(intersectionPQ, "P and Q should not intersect")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
