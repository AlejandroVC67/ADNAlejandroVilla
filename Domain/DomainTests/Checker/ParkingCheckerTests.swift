//
//  ParkingCheckerTests.swift
//  DomainTests
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 9/03/21.
//

import XCTest
@testable import Domain

class ParkingCheckerTests: XCTestCase {
    func testCanPark_givenMaxNumberOfParkedCars_shouldReturnNoCarAvailabilityError() {
        // Given
        let mockedVehicles = createVehiclesMock(carsAmount: 20, bikesAmount: 0)
        let newVehicle = Vehicle(plates: "abc123", type: .car, cylinder: 0, startDate: Date())
        
        // When
        let canPark = ParkingChecker.canPark(parkedVehicles: mockedVehicles, vehicle: newVehicle)
        
        // Then
        switch canPark {
        case .success:
            XCTFail("Should not be able to park a new Car since the max amount of cars has already been parked")
        case .failure(let parkingError):
            XCTAssertEqual(parkingError, ParkingError.noCarAvailability)
        }
    }
    
    func testCanPark_givenMaxNumberOfParkedBikes_shouldReturnNoBikeAvailabilityError() {
        // Given
        let mockedVehicles = createVehiclesMock(carsAmount: 5, bikesAmount: 10)
        let newVehicle = Vehicle(plates: "abc123", type: .bike, cylinder: 0, startDate: Date())
        
        // When
        let canPark = ParkingChecker.canPark(parkedVehicles: mockedVehicles, vehicle: newVehicle)
        
        // Then
        switch canPark {
        case .success:
            XCTFail("Should not be able to park a new bike since the max amount of bikes has already been parked")
        case .failure(let parkingError):
            XCTAssertEqual(parkingError, ParkingError.noBikeAvailability)
        }
    }
    
    func testCanPark_givenVehicleWithSamePlatesAsParkedVehicle_shouldReturnDuplicatePlatesError() {
        // Given
        let mockedVehicles = createVehiclesMock(carsAmount: 5, bikesAmount: 3)
        let newVehicle = Vehicle(plates: "car4", type: .bike, cylinder: 0, startDate: Date())
        
        // When
        let canPark = ParkingChecker.canPark(parkedVehicles: mockedVehicles, vehicle: newVehicle)
        
        // Then
        switch canPark {
        case .success:
            XCTFail("Should not be able to park since the vehicle plates are the same as the ones of a parked vehicle")
        case .failure(let parkingError):
            XCTAssertEqual(parkingError, ParkingError.duplicatePlates)
        }
    }
    
    func testCanPark_givenVehicleWithPlatesStartingWithAOnWednesday_shouldReturnUnableToEnterError() {
        // Given
        let mockedVehicles = createVehiclesMock(carsAmount: 5, bikesAmount: 3)
        let date = Date(timeIntervalSince1970: 1615381200) // Wed Mar 10 2021 08:00:00 GMT-0500 (Colombia Standard Time)
        let newVehicle = Vehicle(plates: "Abc40", type: .bike, cylinder: 0, startDate: date)
        
        // When
        let canPark = ParkingChecker.canPark(parkedVehicles: mockedVehicles, vehicle: newVehicle)
        
        // Then
        switch canPark {
        case .success:
            XCTFail("Should not be able to park since the vehicle plates starts with A and the startDay is a wednesday")
        case .failure(let parkingError):
            XCTAssertEqual(parkingError, ParkingError.unableToEnter)
        }
    }
    
    func testCanPark_givenVehicleWithEmptyPlates_shouldReturnUnableToEnterError() {
        // Given
        let mockedVehicles = createVehiclesMock(carsAmount: 5, bikesAmount: 3)
        let date = Date(timeIntervalSince1970: 1615381200) // Wed Mar 10 2021 08:00:00 GMT-0500 (Colombia Standard Time)
        let newVehicle = Vehicle(plates: "", type: .bike, cylinder: 0, startDate: date)
        
        // When
        let canPark = ParkingChecker.canPark(parkedVehicles: mockedVehicles, vehicle: newVehicle)
        
        // Then
        switch canPark {
        case .success:
            XCTFail("Should not be able to park since the vehicle plates starts with A and the startDay is a wednesday")
        case .failure(let parkingError):
            XCTAssertEqual(parkingError, ParkingError.unableToEnter)
        }
    }
    
    func testCanPark_givenVehicleWithPlatesStartingWithAOnSunday_shouldReturnTrue() {
        // Given
        let mockedVehicles = createVehiclesMock(carsAmount: 5, bikesAmount: 3)
        let date = Date(timeIntervalSince1970: 1615122000) // Sun Mar 07 2021 08:00:00 GMT-0500 (Colombia Standard Time)
        let newVehicle = Vehicle(plates: "Abc41", type: .bike, cylinder: 0, startDate: date)
        
        // When
        let canPark = ParkingChecker.canPark(parkedVehicles: mockedVehicles, vehicle: newVehicle)
        
        // Then
        switch canPark {
        case .success(let canPark):
            XCTAssertTrue(canPark, "The card should be able to park since the plates start with A and it's sunday")
        case .failure:
            XCTFail("The vehicle should be able to park")
        }
    }
    
    
    func testCanPark_givenVehicleWithPlatesStartingWithAOnMonday_shouldReturnTrue() {
        // Given
        let mockedVehicles = createVehiclesMock(carsAmount: 5, bikesAmount: 3)
        let date = Date(timeIntervalSince1970: 1615208400) // Mon Mar 08 2021 08:00:00 GMT-0500 (Colombia Standard Time)
        let newVehicle = Vehicle(plates: "Abc41", type: .car, cylinder: 0, startDate: date)
        
        // When
        let canPark = ParkingChecker.canPark(parkedVehicles: mockedVehicles, vehicle: newVehicle)
        
        // Then
        switch canPark {
        case .success(let canPark):
            XCTAssertTrue(canPark, "The card should be able to park since the plates start with A and it's Monday")
        case .failure:
            XCTFail("The vehicle should be able to park")
        }
    }
}


private extension ParkingCheckerTests {
    func createVehiclesMock(carsAmount: Int, bikesAmount: Int) -> [Vehicle] {
        var mockedVehicles: [Vehicle] = []
        
        for index in 0...carsAmount {
            mockedVehicles.append(Vehicle(plates: "car\(index)", type: .car, cylinder: 0, startDate: Date()))
        }
        
        for index in 0...bikesAmount {
            mockedVehicles.append(Vehicle(plates: "bike\(index)", type: .bike, cylinder: 0, startDate: Date()))
        }
        
        return mockedVehicles
    }
}
