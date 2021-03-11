//
//  ParkingRepository.swift
//  Domain
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 8/03/21.
//

import Foundation

public protocol ParkingRepository {
    func getAllVehicles() -> [Vehicle]
    func add(vehicle: Vehicle)
    func exitVehicle(plates: String)
}
