//
//  ParkingManagerTests.swift
//  DomainTests
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 12/03/21.
//

import XCTest
@testable import Domain

class ParkingServiceTests: XCTestCase {
    
    func testInit_givenPersistence_shouldCreateManagerInstance() {
        // Given
        let mock = RepositoryMock()
        
        // When
        let manager = ParkingService(persistence: mock)
        
        // Then
        XCTAssertNotNil(manager, "Manager should not be nil")
    }
    
    func testAdd_givenVehicle_shouldReturnSuccess() {
        // Given
        let mock = RepositoryMock()
        let manager = ParkingService(persistence: mock)
        let vehicle = Vehicle(plates: "test", type: .car, cylinder: 100)
        
        // When
        let result = manager.add(vehicle: vehicle)
        
        // Then
        switch result {
        case .success:
            XCTAssertTrue(true)
        case .failure:
            XCTFail("Should not fail")
        }
    }
    
    func testAdd_givenVehicleWithPlatesStartingWithAOnAWednesday_shouldReturnFailure() {
        // Given
        let mock = RepositoryMock()
        let manager = ParkingService(persistence: mock)
         
        let vehicle = Vehicle(plates: "ABC123", type: .car, cylinder: 100, startDate: Date(timeIntervalSince1970: 1615381200)) // Wed Mar 10 2021 08:00:00 GMT-0500 (Colombia Standard Time)
        
        // When
        let result = manager.add(vehicle: vehicle)
        
        // Then
        switch result {
        case .success:
            XCTFail("Shouldn't be able to park")
        case .failure:
            XCTAssertTrue(true, "The vehicle was not able to enter")
        }
    }
    
    func testExitVehicle_givenVehiclePlates_shouldRemoveVehicle() {
        // Given
        let mock = RepositoryMock()
        let manager = ParkingService(persistence: mock)
         
        let vehicle = Vehicle(plates: "BBC123", type: .car, cylinder: 100, startDate: Date(timeIntervalSince1970: 1615381200)) // Wed Mar 10 2021 08:00:00 GMT-0500 (Colombia Standard Time)
        _ = manager.add(vehicle: vehicle)
        
        // When
        let price = manager.exitVehicle(plates: vehicle.plates)
        
        // Then
        XCTAssertNotEqual(price, 0, "Price should not be zero")
    }
    
    func testExitVehicle_givenVehicleThatIsNotParked_shouldReturnZero() {
        // Given
        let mock = RepositoryMock()
        let manager = ParkingService(persistence: mock)
         
        let vehicle = Vehicle(plates: "BBC123", type: .car, cylinder: 100, startDate: Date(timeIntervalSince1970: 1615381200)) // Wed Mar 10 2021 08:00:00 GMT-0500 (Colombia Standard Time)
        
        // When
        let price = manager.exitVehicle(plates: vehicle.plates)
        
        // Then
        XCTAssertEqual(price, 0, "Price should  be zero")
    }
}
