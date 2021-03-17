//
//  EntityParser.swift
//  DataAccess
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 12/03/21.
//

import Foundation
import RealmSwift
import Domain

class VehicleTrasnslator {
    static func transformIntoEntity(vehicle: Vehicle) -> VehicleEntity {
        let entity = VehicleEntity()
        entity.plates = vehicle.plates
        entity.cylinder = vehicle.cylinder
        entity.type = vehicle.type.rawValue
        entity.startDate = vehicle.startDate
        return entity
    }
    
    static func transformIntoVehicles(entities: Results<VehicleEntity>) -> [Vehicle?]? {
        return entities.map { (entity) -> Vehicle? in
            let type = VehicleType(rawValue: entity.type) ?? .car
            
            return try? Vehicle(plates: entity.plates,
                           type: type,
                           cylinder: entity.cylinder,
                           startDate: entity.startDate)
        }
    }
}
