//
//  RayTests.swift
//  QuiddityTests
//
//  Created by David Crooks on 18/01/2019.
//  Copyright © 2019 David Crooks. All rights reserved.
//

import XCTest
@testable import Quiddity

class RayTests: XCTestCase {
let tolerance = 0.00001
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIntersection() {
        let v = Vec2(x:1.0,y:1.0)
        let p = Line(origin:Vec2.zero,direction:v)
        let q = Line(origin:Vec2(x:-1.0,y:1.0),direction:Vec2(x:1.0,y:0.0))
        
        let excpectedIntersection = Vec2(x:1.0,y:1.0)
        
        let intersectionPQ = p.intersect(with:q)
        XCTAssertNotNil(intersectionPQ, "P and Q should intersect")
        
        if let v = intersectionPQ
        {
            XCTAssertEqual(v.x, excpectedIntersection.x, accuracy: tolerance, "P and Q should intesect \(excpectedIntersection)")
            XCTAssertEqual(v.y, excpectedIntersection.y, accuracy: tolerance, "P and Q should intesect at \(excpectedIntersection)")
        }
    }
    
    func testNonIntersection() {
        let v = Vec2(x:1.0,y:1.0)
        let p = Line(origin:Vec2.zero,direction:v)
        let q = Line(origin:Vec2.zero,direction:v)
        
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
