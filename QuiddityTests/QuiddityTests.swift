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

    var testPoints:[CGPoint]?
    
    override func setUp() {
        super.setUp()

        let range = -5.0...5.0
        
        testPoints = (0...100).map{ _ in
            return CGPoint(x: Double.random(in: range), y: Double.random(in: range))
        }
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCGPoint() {
        let tolerance = CGFloat(0.00001)
        guard let testPoints = testPoints else { XCTFail("Test points nil"); return }
        
        
        func testAssosiative(a:CGPoint,b:CGPoint,c:CGPoint)  {
            
            let lhs = ( a + b ) + c
            let rhs = a + ( b + c )
            let diff = lhs - rhs
            
            XCTAssert(abs(diff.x) < tolerance, "+ Assositivity fails for x with \(a),\(b),\(c)")
            XCTAssert(abs(diff.y) < tolerance, "+ Assositivity fails for y with \(a),\(b),\(c)")
        }
        
        
        func testDot(a:CGPoint,b:CGPoint, c:CGPoint) {
            
            //commutative
            XCTAssertEqual(a.dot(b),b.dot(a),accuracy:tolerance,"Dot Commutativity fails for x with \(a),\(b)")
            
            //distribitve over addition
            XCTAssertEqual(a.dot(b + c),a.dot(b) + a.dot(c),accuracy:tolerance, "Dot Distribitivity fails for x with \(a),\(b),\(c)")
            
            let orthogonalToA = CGPoint(x: -a.y, y: a.x)
            XCTAssertEqual(a.dot(orthogonalToA), 0.0, accuracy: tolerance, "Dot orthoganlity fails for \(a)")
            //XCTAssert(abs(a.dot(orthogonalToA))<tolerance ,"Dot orthoganlity fails for \(a)")
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
            
        }
    }

}
