//
//  TeamNineTests.swift
//  TeamNineTests
//
//  Created by 이현호 on 2020/09/15.
//  Copyright © 2020 이현호. All rights reserved.
//

import XCTest
@testable import TeamNine

class TeamNineTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetSum() throws {
        let test = Test(aaa: 3, bbb: 5)
        test.getSum(aaa: 3, bbb: 6)
        XCTAssertEqual(test.getSum(aaa: 3, bbb: 6), 9)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
