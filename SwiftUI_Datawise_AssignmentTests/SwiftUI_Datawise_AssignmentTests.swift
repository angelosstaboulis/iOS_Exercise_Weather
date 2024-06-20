//
//  SwiftUI_Datawise_AssignmentTests.swift
//  SwiftUI_Datawise_AssignmentTests
//
//  Created by Angelos Staboulis on 17/6/24.
//

import XCTest
@testable import SwiftUI_Datawise_Assignment

final class SwiftUI_Datawise_AssignmentTests: XCTestCase {
    let viewModel = FetchWeatherDataViewModel()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWeatherDataDaily() throws {
        let expectation = expectation(description: "Loading Daily Weather Data")
        viewModel.fetchWeatherDataDaily(endPoint: "/daily") { array in
            defer{
                expectation.fulfill()
            }
            if array.count == 0
            {
                XCTFail("Fail to fetch data")
            }
        }
        waitForExpectations(timeout: 10)
    }
    func testWeatherDataHourly() throws {
        let expectation = expectation(description: "Loading Hourly Weather Data")
        viewModel.fetchWeatherDataDaily(endPoint: "/hourly") { array in
            defer{
                expectation.fulfill()
            }
            if array.count == 0
            {
                XCTFail("Fail to fetch data")
            }
        }
        waitForExpectations(timeout: 10)
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
