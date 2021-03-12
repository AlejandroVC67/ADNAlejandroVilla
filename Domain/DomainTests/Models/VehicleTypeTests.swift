//
//  VehicleTypeTests.swift
//  DomainTests
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 12/03/21.
//

import XCTest
@testable import Domain

class VehicleTypeTests: XCTestCase {
    func testInit_givenPlatesCylinderAndType_shouldInstanciateModelCorrectly() {
        // Given
        let expectedTypes = ["car", "bike"]
        
        // When
        let types = VehicleType.toString()
        
        // Then
        XCTAssertEqual(types, expectedTypes, "The types should be \(expectedTypes)")
    }
}
