//
//  Car.swift
//  Domain
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 8/03/21.
//

import Foundation

public struct Vehicle: Identifiable, Billable {
    // MARK: - Identifiable
    let plates: String
    let brand: String
    let type: VehicleType
    let cylinder: Int
    
    //MARK: - Billable
    let startDate: Date
}

public extension Vehicle {
    static func ==(lhs: Vehicle, rhs: Vehicle) -> Bool {
        return lhs.plates == rhs.plates
    }
}
