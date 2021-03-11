//
//  VehicleEntity.swift
//  DataAccess
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 11/03/21.
//

import Foundation
import RealmSwift
import Domain

class VehicleEntity: Object {
    // MARK: - Identifiable
    @objc dynamic public var plates: String = ""
    @objc dynamic public var type: String = ""
    @objc dynamic public var cylinder: Int = 0
    
    //MARK: - Billable
    @objc dynamic public var startDate: Date = Date()
    
//    init(plates: String, type: String, cylinder: Int, date: Date) {
//        self.plates = plates
//        self.type = type
//        self.cylinder = cylinder
//        self.startDate = date
//    }
}

extension Results where Element : VehicleEntity {
    func transform() -> [Vehicle] {
        return self.map { (entity) -> Vehicle in
            let type = VehicleType(rawValue: entity.type) ?? .car
            
            return Vehicle(plates: entity.plates,
                           type: type,
                           cylinder: entity.cylinder,
                           startDate: entity.startDate)
        }
    }
}
