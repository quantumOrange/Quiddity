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
    let tolerance = 0.0001
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
    
    func testCircumcenter() {
        let p = Vec2(x:0.0,y:1.0)
        let q = Vec2(x:-1.0,y:-1.5)
        let r = Vec2(x:1.25,y:-0.75)
        
        let triangleA = Triangle(A:p, B:q, C:r)
        let triangleB = Triangle(A:r, B:p, C:q)
        
        guard let c1 = triangleA.circumcenter,
            let c2 = triangleB.circumcenter else {
                XCTFail("Circumcenters should not be nil unless a triangle is degenerate")
                return
        }
        
        
        XCTAssertEqual(c1.x, c2.x, accuracy:tolerance,"Circumcenters should be egual fro equal triangles")
        XCTAssertEqual(c1.y, c2.y, accuracy:tolerance,"Circumcenters should be egual fro equal triangles")
        
        let d1  = c1.distanceTo(triangleA.a)
        let d2  = c1.distanceTo(triangleA.b)
        let d3  = c1.distanceTo(triangleA.c)
        
        XCTAssertEqual(d1, d2, accuracy:tolerance,"Circumcenters should be egual equdistant from triangle veryticies")
        XCTAssertEqual(d2, d3, accuracy:tolerance,"Circumcenters should be egual equdistant from triangle veryticies")
        
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
