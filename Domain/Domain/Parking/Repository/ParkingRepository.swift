//
//  ParkingRepository.swift
//  Domain
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 8/03/21.
//

import Foundation

public protocol ParkingRepository {
    static var vehicles: [Vehicle] { get set }
    
    static func getAllVehicles() -> [Vehicle]
    static func add(vehicle: Vehicle) -> Result<String, ParkingError>
    static func remove(vehicle: Vehicle) -> Double
}
