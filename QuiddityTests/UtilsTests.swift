//
//  UtilsTests.swift
//  QuiddityTests
//
//  Created by David Crooks on 26/04/2019.
//  Copyright © 2019 David Crooks. All rights reserved.
//

import XCTest
@testable import Quiddity

class UtilsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPermute() {
        let array = [1,2,3,4]
        
        XCTAssertTrue(permute(array, by: 1) == [4,1,2,3] , "[1,2,3,4] permuted by 1 should be [4,1,2,3], but got \(permute(array, by: 1))" )
        XCTAssertTrue(permute(array, by: 2) == [3,4,1,2] , "[1,2,3,4] permuted by 2 should be [3,4,1,2], but got \(permute(array, by: 2))")
        XCTAssertTrue(permute(array, by: 3) == [2,3,4,1] , "[1,2,3,4] permuted by 3 should be  [2,3,4,1] but got \(permute(array, by: 3))")
        XCTAssertTrue(permute(array, by: 4) == array, "[1,2,3,4] permuted by 4 should be [1,2,3,4], but got \(permute(array, by: 4))")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
