//
//  RealmPersistence.swift
//  DataAccess
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 11/03/21.
//

import Foundation
import RealmSwift
import Domain


public class RealmPersistence: ParkingRepository {
    private var database: Realm?
    
    public init() {
       database = try? Realm()
    }
    
    public func getAllVehicles() -> [Vehicle] {
        guard let entities = database?.objects(VehicleEntity.self) else {
            return []
        }
        
        let vehicles = VehicleTrasnslator.transformIntoVehicles(entities: entities)
        return vehicles
    }
    
    public func add(vehicle: Vehicle) {
        let entity = VehicleTrasnslator.transformIntoEntity(vehicle: vehicle)
        try? database?.write({
            database?.add(entity)
        })
    }
    
    public func exitVehicle(plates: String) {
        let predicate = NSPredicate(format: "plates = %@", plates)
        guard let entity = database?.objects(VehicleEntity.self).filter(predicate) else {
            return
        }
        
        try? database?.write({
            database?.delete(entity)
        })
    }
}
