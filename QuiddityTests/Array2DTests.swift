//
//  Array2DTests.swift
//  QuiddityTests
//
//  Created by David Crooks on 25/05/2019.
//  Copyright © 2019 David Crooks. All rights reserved.
//
import Quiddity
import XCTest

class Array2DTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFuncInit() {
        
        let array = Array2D<Int>(rows: 2, columns: 2, f: { $0+$1 })
        
        XCTAssertEqual(array[1,1], 2)
    
    }
    
    func testRepeatingInit() {
        
        let array = Array2D<Int>(rows: 4, columns: 4, repeating: 3)
        
        XCTAssertEqual(array[3,1], 3)
        XCTAssertEqual(array[2,2], 3)
        
    }
    
    func testInitWithArray() {
        
        guard let array = Array2D<Int>(rows: 2, columns: 2, values: [1,2,3,4]) else {
            
            XCTFail()
            return
        }
        
        XCTAssertEqual(array[0,0], 1)
        XCTAssertEqual(array[0,1], 2)
        XCTAssertEqual(array[1,0], 3)
        XCTAssertEqual(array[1,1], 4)
        
    }
    
    func testSubscript() {
        
        var array = Array2D<Int>(rows: 4, columns: 4, repeating: 0)
        
        array[3,1] = 10
        array[2,3] = 11
        
        XCTAssertEqual(array[3,1], 10)
        XCTAssertEqual(array[2,3], 11)
        XCTAssertEqual(array[0,0], 0)
    
    }

    func testMap(){
        guard let array = Array2D<Int>(rows: 2, columns: 2, values: [1,2,3,4]) else {
            XCTFail()
            return
        }
        
        let newArray = array.map { $0*$0 }
        
        XCTAssertEqual(newArray[1,1], 16)
    }
    
    func testEnumerated(){
        let array = Array2D<Float>(rows: 5, columns: 5, repeating: 1.0)
        
        // a(i,j) -> sqrt(i+j) + a(i,j)
        let newArray = array.enumerated().map{  sqrt(Float(  $0.0 + $0.1 )) + $0.2  }
        
        // sqrt(8) + 1
        XCTAssertEqual(newArray[4,4], 2*sqrt(2.0) + 1)
    }
    
    func testZip(){
        let array = Array2D<Int>(rows: 2, columns: 2,  values: [0,1,1,0])!
        let array2 = Array2D<Int>(rows: 2, columns: 2, values: [1,0,0,1])!
        
        let array3 = zip(array,array2)
        
        XCTAssertEqual(array3[0,0].0,0)
        XCTAssertEqual(array3[0,0].1,1)
        XCTAssertEqual(array3[1,1].0,0)
        XCTAssertEqual(array3[1,1].1,1)
        XCTAssertEqual(array3[0,1].0,1)
        XCTAssertEqual(array3[0,1].1,0)
        
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
