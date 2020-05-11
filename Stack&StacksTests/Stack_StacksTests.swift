//
//  Stack_StacksTests.swift
//  Stack&StacksTests
//
//  Created by Adnan Sumra on 2/20/20.
//  Copyright © 2020 Adnan Sumra. All rights reserved.
//

import XCTest
@testable import Stack_Stacks

class Stack_StacksTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSessionCreates() {
        let sessionSvc = SessionService()
        
        let data = ["buyIns": [25.0], "totalExpense": 25.0, "type": "Cash", "blinds": "$0.25/ $0.25", "playerCount": 1, "location": "My House", "startTime": Date()] as [String : Any]
        
        XCTAssertNotNil(sessionSvc.createSession(data: data))
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
