//
//  Parking.swift
//  Domain
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 8/03/21.
//

import Foundation

public class ParkingManager: ParkingRepository {
    /**
     Temporal Object, will use Realm in the future
     */
    public static var vehicles: [Vehicle] = []
    
    public static func getAllVehicles() -> [Vehicle] {
        return vehicles
    }
    
    public static func add(vehicle: Vehicle) -> Result<String, ParkingError> {
        let isParkeable = ParkingChecker.canPark(parkedVehicles: vehicles, vehicle: vehicle)
        switch isParkeable {
        case .success:
            vehicles.append(vehicle)
            return .success("Successfully added vehicle")
        case .failure(let error):
            return .failure(error)
        }
    }
    
    public static func remove(vehicle: Vehicle) -> Double {
        let price = ParkingDebtCollector(vehicle: vehicle).calculateCheckout()
        vehicles.removeAll(where: { $0 == vehicle })
        return price
    }
}
