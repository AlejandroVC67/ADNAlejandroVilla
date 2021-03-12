//
//  ParkingErrorTests.swift
//  DomainTests
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 12/03/21.
//

import XCTest
@testable import Domain

class ParkingErrorTests: XCTestCase {
    func testErrorDescription_givenNoCarAvailabilityErrorType_descriptionShouldMatch() {
        // Given
        let expectedDescription = "Our car availability is full, please come back later"
        
        // When
        let description = ParkingError.noCarAvailability.errorDescription
        
        // Then
        XCTAssertEqual(description, expectedDescription, "The description expected is \(expectedDescription)")
    }
    
    func testErrorDescription_givenNoBikeAvailabilityErrorType_descriptionShouldMatch() {
        // Given
        let expectedDescription = "Our bike availability is full, please come back later"
        
        // When
        let description = ParkingError.noBikeAvailability.errorDescription
        
        // Then
        XCTAssertEqual(description, expectedDescription, "The description expected is \(expectedDescription)")
    }
    
    func testErrorDescription_givenUnableToEnterErrorType_descriptionShouldMatch() {
        // Given
        let expectedDescription = "Your Vehicle can't enter today"
        
        // When
        let description = ParkingError.unableToEnter.errorDescription
        
        // Then
        XCTAssertEqual(description, expectedDescription, "The description expected is \(expectedDescription)")
    }
    
    func testErrorDescription_givenDuplicatePlatesErrorType_descriptionShouldMatch() {
        // Given
        let expectedDescription = "There is already a parked vehicle with the same plates"
        
        // When
        let description = ParkingError.duplicatePlates.errorDescription
        
        // Then
        XCTAssertEqual(description, expectedDescription, "The description expected is \(expectedDescription)")
    }
}
