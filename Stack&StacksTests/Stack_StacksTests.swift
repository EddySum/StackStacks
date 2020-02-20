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
        let sessionOne = Session.init(
            type: SessionTypes.Cash,
            buyIn: 25,
            startTime: Date.init()
        )
        
        XCTAssertNotNil(sessionOne);
    }
    
    func testSessionCreateFails() {
        let invalidbuyIn = Session.init(
            type: SessionTypes.Cash,
            buyIn: -1,
            startTime: Date.init()
        )
        
        XCTAssertNil(invalidbuyIn)
    }
    
    func testRebuyFunc() {
        let sessionOne = Session.init(
            type: SessionTypes.Cash,
            buyIn: 25,
            startTime: Date.init()
        )
        
        sessionOne?.rebuy(rebuy: 25)
        XCTAssertEqual(sessionOne?.totalExpense, 50)
        
        XCTAssertEqual(sessionOne?.buyIns.count, 2)
    }
    
    func testCashoutFunc() {
        let sessionOne = Session.init(
            type: SessionTypes.Cash,
            buyIn: 25,
            startTime: Date.init()
        )
        
        sessionOne?.cashout(cashout: 75)
        XCTAssertEqual(sessionOne?.netProfit, 50)
    }
    
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
