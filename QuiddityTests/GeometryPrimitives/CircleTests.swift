//
//  CircleTests.swift
//  QuiddityTests
//
//  Created by David Crooks on 27/04/2019.
//  Copyright © 2019 David Crooks. All rights reserved.
//

import XCTest
@testable import Quiddity

class CircleTests: XCTestCase {
let tolerance = 0.0000001
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAreaAndCircumferance() {
        let c = Circle(center: Vec2.zero, radius: 1)
    
        XCTAssertEqual(c.area, Double.pi , accuracy:tolerance , "Area of unit circle should be \(Double.pi) but got \(c.area)")
        XCTAssertEqual(c.circumferance, 2.0*Double.pi , accuracy:tolerance , "Circumferance of unit circle should be \(2.0*Double.pi) but got \(c.circumferance)")
    }
    
    func testIntersection(){
        
        let tolerance = 0.000000001
        let c1 = Circle(center: Vec2.zero, radius: 1)
        let c2 = Circle(center: Vec2(x: 1,y: 1), radius: 1)
        
        let intersection = c1.intersect(with: c2).sorted(by: {$0.x > $1.x})
        
        let expected = [Vec2(x: 1, y: 0),Vec2(x: 0, y: 1)].sorted(by: {$0.x > $1.x})
        
        XCTAssert(intersection.count == 2)
        
        if let result = intersection.first,
            let exp = expected.first,
            let result2 = intersection.last,
            let exp2 = expected.last
        {
            XCTAssertEqual(result.x, exp.x, accuracy: tolerance)
            XCTAssertEqual(result.y, exp.y, accuracy: tolerance)
            XCTAssertEqual(result2.x, exp2.x, accuracy: tolerance)
            XCTAssertEqual(result2.y, exp2.y, accuracy: tolerance)
        }
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
