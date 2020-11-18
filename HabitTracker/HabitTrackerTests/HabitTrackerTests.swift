//
//  HabitTrackerTests.swift
//  HabitTrackerTests
//
//  Created by Oliwia Michalak on 06/10/2020.
//

import XCTest
@testable import HabitTracker

class HabitTrackerTests: XCTestCase {
    
    var validation: ValidationService!
    
    override func setUp() {
        super.setUp()
        validation = ValidationService()
    }
    
    override func tearDown() {
        validation = nil
        super.tearDown()
    }
    
    func test_is_aim_name_is_valid() throws {
       XCTAssertNoThrow(try validation.validateAimName("Drawing"))
        XCTAssertNoThrow(try validation.validateAimName("Dance"))
    }
    
    func test_aim_name_is_nil() throws {
        XCTAssertThrowsError(try validation.validateAimName(nil))
    }
    
    func test_aim_is_too_long() throws {
        XCTAssertThrowsError(try validation.validateAimName("SuperLong name of new goal, such as description of activity"))
    }
    
    func test_aim_is_too_short() throws {
        XCTAssertThrowsError(try validation.validateAimName("No"))
    }
    
    func test_duration_is_notValid() throws {
        let expectedError = ValidationError.invalidDuration
        var error: ValidationError?
        let duration = -4
        
        XCTAssertThrowsError(try validation.validateDuration(duration)) {
            thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
    }
    
    func test_done_is_notValid() throws {
        let expectedError = ValidationError.emptyDone
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validateDone(nil)) { thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
    }
    
}
