//
//  Parking.swift
//  Domain
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 8/03/21.
//

import Foundation

public class ParkingManager {

    private var persistence: ParkingRepository
    
    public init(persistence: ParkingRepository) {
        self.persistence = persistence
    }
    
    public func getAllVehicles() -> [Vehicle] {
        return persistence.getAllVehicles()
    }
    
    public func add(vehicle: Vehicle) -> Result<String, ParkingError> {
        let isParkeable = ParkingChecker.canPark(parkedVehicles: getAllVehicles(), vehicle: vehicle)
        switch isParkeable {
        case .success:
            persistence.add(vehicle: vehicle)
            return .success("Successfully added vehicle")
        case .failure(let error):
            return .failure(error)
        }
    }
    
    public func exitVehicle(plates: String) -> Double {
        guard let vehicle = getAllVehicles().first(where: { $0.plates == plates }) else {
            return 0
        }
        
        let price = ParkingDebtCollector(vehicle: vehicle).calculateCheckout()
        persistence.exitVehicle(plates: plates)
        return price
    }
}
