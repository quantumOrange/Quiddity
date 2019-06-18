//
//  QuiddityTests.swift
//  QuiddityTests
//
//  Created by David Crooks on 15/01/2019.
//  Copyright © 2019 David Crooks. All rights reserved.
//

import XCTest
@testable import Quiddity

class QuiddityTests: XCTestCase {

    var testPoints:[Vec2] = []
    
    override func setUp() {
        super.setUp()

        let range = -5.0...5.0
        
        testPoints = (0...100000).map{ _ in
            return Vec2(x: Double.random(in: range), y: Double.random(in: range))
        }
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCGPoint() {
        let tolerance = 0.00001
        
        func testAssosiative(a:Vec2,b:Vec2, c:Vec2)   {
            
            let lhs = ( a + b ) + c
            let rhs = a + ( b + c )
            let diff = lhs - rhs
            
            XCTAssert(abs(diff.x) < tolerance, "+ Assositivity fails for x with \(a),\(b),\(c)")
            XCTAssert(abs(diff.y) < tolerance, "+ Assositivity fails for y with \(a),\(b),\(c)")
        }
        
        
        func testDot(a:Vec2,b:Vec2, c:Vec2) {
            
            //commutative
            XCTAssertEqual(a.dot(b),b.dot(a),accuracy:tolerance,"Dot Commutativity fails for x with \(a),\(b)")
            
            //distribitve over addition
            XCTAssertEqual(a.dot(b + c),a.dot(b) + a.dot(c),accuracy:tolerance, "Dot Distribitivity fails for x with \(a),\(b),\(c)")
            
            let orthogonalToA = Vec2(x: -a.y, y: a.x)
            XCTAssertEqual(a.dot(orthogonalToA), 0.0, accuracy: tolerance, "Dot orthoganlity fails for \(a)")
        }
        
        //test  assosiative
        testAssosiative(a: testPoints[3], b: testPoints[8], c: testPoints[9])
        testAssosiative(a: testPoints[7], b: testPoints[5], c: testPoints[6])
        testAssosiative(a: testPoints[0], b: testPoints[1], c: testPoints[2])
        
        
        //test dot
        testDot(a: testPoints[3], b: testPoints[8], c: testPoints[9])
        testDot(a: testPoints[7], b: testPoints[5], c: testPoints[6])
        testDot(a: testPoints[0], b: testPoints[1], c: testPoints[2])
        
    }

   
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            _ = testPoints.map{ 20.0*$0.normalized }
                .map { Circle(center: $0, radius: 5.0)
            }
        }
    }
    
    func testPerformanceTrianglesToCircles() {
        
        let pointTriples = (0..<100000).map { n in
            (Vec2.gaussian(),
             Vec2.gaussian(),
             Vec2.gaussian())
        }
        
        let unitCircle = Circle(center: Vec2.zero, radius: 1.0)
        
        self.measure {
            let results = pointTriples
                            .map( Triangle.init )
                            .filter{ $0.contains(point: Vec2.zero)}
                            .compactMap( Circle.init )
                            .map { $0.intersect(with: unitCircle)}
                            .filter{ $0.count == 2 }
                            .map{ LineSegment(start: $0.first!,end: $0.last!)}
                            .map{$0.length}
            
           // print(results.count)
            
        }
        
    }

}
