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
    
    func testInteriorAngles(){
        func sumInteriorAnglesTest(_ polygon:Polygon) {
            var total = 0.0
            
            for i in 0..<polygon.verticies.count {
                total += polygon.interiorAngle(at: i)
            }
            
            let expected = Double(polygon.verticies.count - 2) * Double.pi
            
            XCTAssertEqual(total, expected , accuracy: 0.0001, "Sum of interior angles should be (n-2) * 180 degrees == \(expected) radians, but found \(total)")
        }
        
        let hexagon = Polygon(verticies: Circle(center: Vec2.zero, radius: 2.0).createPoints(6))
        let heptagon = Polygon(verticies: Circle(center: Vec2.zero, radius: 2.0).createPoints(7))
        let octagon = Polygon(verticies: Circle(center: Vec2.zero, radius: 2.0).createPoints(8))
        
        let elevengon = Polygon(verticies: Circle(center: Vec2.zero, radius: 2.0).createPoints(11))
        
        sumInteriorAnglesTest(hexagon)
        sumInteriorAnglesTest(heptagon)
        sumInteriorAnglesTest(octagon)
        sumInteriorAnglesTest(elevengon)
    
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
