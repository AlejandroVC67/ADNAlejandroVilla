//
//  Parking.swift
//  Domain
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 8/03/21.
//

import Foundation

class Parking: ParkingRepository {
    /**
     Temporal Object, will use Realm in the future
     */
    static var vehicles: [Vehicle] = []
    
    static func getAllVehicles() -> [Vehicle] {
        return vehicles
    }
    
    static func add(vehicle: Vehicle) { /*Do I need a Result<Bool, ParkingError> here too?*/
        let isParkeable = ParkingChecker.canPark(parkedVehicles: vehicles, vehicle: vehicle)
        switch isParkeable {
        case .success:
            vehicles.append(vehicle)
        case .failure(let error):
            // Return error
            print(error)
        }
    }
    
    static func remove(vehicle: Vehicle) -> Double {
        let price = ParkingDebtCollector(vehicle: vehicle).calculateCheckout()
        vehicles.removeAll(where: { $0.plates == vehicle.plates })
        return price
    }
}
