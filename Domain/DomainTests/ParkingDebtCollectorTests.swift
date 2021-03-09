//
//  ParkingDebtCollectorTests.swift
//  DomainTests
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 9/03/21.
//

import XCTest
@testable import Domain

class ParkingDebtCollectorTests: XCTestCase {
    
    func testCalculateCheckout_givenCarParked1DayAnd4HoursAgo_shouldHaveCorrectPrice() {
        // Given
        let expectedPrice: Double = 12000
        let vehicle = Vehicle(plates: "abc123", brand: "Audi", type: .car, cylinder: 200, startDate: Date(timeIntervalSinceNow: -100800))
        let collector = ParkingDebtCollector(vehicle: vehicle)
        
        // When
        let result = collector.calculateCheckout()
        
        // Then
        XCTAssertEqual(result, expectedPrice, "The cost of the parking should be \(expectedPrice) since the car was parked 13 hours")
    }
    
    func testCalculateCheckout_givenCarParked6HoursAgo_shouldHaveCorrectPrice() {
        // Given
        let expectedPrice: Double = 6000
        let vehicle = Vehicle(plates: "abc123", brand: "Audi", type: .car, cylinder: 200, startDate: Date(timeIntervalSinceNow: -21600))
        let collector = ParkingDebtCollector(vehicle: vehicle)
        
        // When
        let result = collector.calculateCheckout()
        
        // Then
        XCTAssertEqual(result, expectedPrice, "The cost of the parking should be \(expectedPrice) since the car was parked 6 hours")
    }

    func testCalculateCheckout_givenCarParked9HoursAgo_shouldHaveCorrectPrice() {
        // Given
        let expectedPrice: Double = 8000
        let vehicle = Vehicle(plates: "abc123", brand: "Audi", type: .car, cylinder: 200, startDate: Date(timeIntervalSinceNow: -32400))
        let collector = ParkingDebtCollector(vehicle: vehicle)
        
        // When
        let result = collector.calculateCheckout()
        
        // Then
        XCTAssertEqual(result, expectedPrice, "The cost of the parking should be \(expectedPrice) since the car was parked 9 hours")
    }
    
    func testCalculateCheckout_givenCarParked15HoursAgo_shouldHaveCorrectPrice() {
        // Given
        let expectedPrice: Double = 14000
        let vehicle = Vehicle(plates: "abc123", brand: "Audi", type: .car, cylinder: 200, startDate: Date(timeIntervalSinceNow: -54000))
        let collector = ParkingDebtCollector(vehicle: vehicle)
        
        // When
        let result = collector.calculateCheckout()
        
        // Then
        XCTAssertEqual(result, expectedPrice, "The cost of the parking should be \(expectedPrice) since the car was parked 9 hours")
    }
    
    func testCalculateCheckout_givenBikeParked1DayAnd4HoursAgoAndLowCylinder_shouldHaveCorrectPrice() {
        // Given
        let expectedPrice: Double = 6000
        let vehicle = Vehicle(plates: "abc123", brand: "Honda", type: .bike, cylinder: 200, startDate: Date(timeIntervalSinceNow: -100800))
        let collector = ParkingDebtCollector(vehicle: vehicle)
        
        // When
        let result = collector.calculateCheckout()
        
        // Then
        XCTAssertEqual(result, expectedPrice, "The cost of the parking should be \(expectedPrice) since the bike was parked 13 hours")
    }
    
    func testCalculateCheckout_givenBikeParked1DayAnd4HoursAgoAndHighCylinder_shouldHaveCorrectPrice() {
        // Given
        let expectedPrice: Double = 8000
        let vehicle = Vehicle(plates: "abc123", brand: "Honda", type: .bike, cylinder: 800, startDate: Date(timeIntervalSinceNow: -100800))
        let collector = ParkingDebtCollector(vehicle: vehicle)
        
        // When
        let result = collector.calculateCheckout()
        
        // Then
        XCTAssertEqual(result, expectedPrice, "The cost of the parking should be \(expectedPrice) since the bike was parked 13 hours")
    }
    
}