//
//  RepositoryMock.swift
//  DomainTests
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 12/03/21.
//

import Foundation
@testable import Domain

class RepositoryMock: ParkingRepository {
    private var vehicles: [Vehicle] = []
    
    func getAllVehicles() -> [Vehicle] {
        return vehicles
    }
    
    func add(vehicle: Vehicle) {
        vehicles.append(vehicle)
    }
    
    func exitVehicle(plates: String) {
        vehicles.removeAll(where: { $0.plates == plates })
    }
}
