//
//  VehicleTranslatorTests.swift
//  DataAccessTests
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 12/03/21.
//

import XCTest
import Domain
import RealmSwift
@testable import DataAccess

class VehicleTranslatorTests: XCTestCase {
    
    func testTransformIntoEntity_givenVehicle_shouldReturnVehicleEntity() {
        // Given
        let vehicle = Vehicle(plates: "test", type: .car, cylinder: 100, startDate: Date())
        
        // When
        let entity = VehicleTrasnslator.transformIntoEntity(vehicle: vehicle)
        
        // Then
        XCTAssertEqual(entity.plates, vehicle.plates, "The value should be \(vehicle.plates)")
        XCTAssertEqual(entity.cylinder, vehicle.cylinder, "The value should be \(vehicle.cylinder)")
        XCTAssertEqual(entity.type, vehicle.type.rawValue, "The value should be \(vehicle.type.rawValue)")
        XCTAssertEqual(entity.startDate, vehicle.startDate, "The value should be \(vehicle.startDate)")
    }
}
