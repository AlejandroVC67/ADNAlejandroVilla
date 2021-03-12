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
}
