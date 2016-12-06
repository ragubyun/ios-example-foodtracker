//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by RaguByun on 2016. 11. 29..
//  Copyright © 2016년 RaguByun. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    // MARK: FooTracker Tests
    
    func testMealInitialization() {
        // Success cases.
        let potentialItem = Meal(name: "Newest meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
        
        // Failure case.
        let noName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName, "Empty name is invalid")
        
        let badRating = Meal(name: "Really bad rating", photo: nil, rating: -1)
        XCTAssertNil(badRating, "negative ratings are invalid, be positive")
    }
    
}
