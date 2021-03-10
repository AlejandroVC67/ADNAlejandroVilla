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
    let type: VehicleType
    let cylinder: Int
    
    //MARK: - Billable
    let startDate: Date
    
    public init(plates: String, type: VehicleType, cylinder: Int) {
        self.plates = plates
        self.type = type
        self.cylinder = cylinder
        self.startDate = Date()
    }
    
    internal init(plates: String, type: VehicleType, cylinder: Int, startDate: Date) {
        self.plates = plates
        self.type = type
        self.cylinder = cylinder
        self.startDate = startDate
    }
}

public extension Vehicle {
    static func ==(lhs: Vehicle, rhs: Vehicle) -> Bool {
        return lhs.plates == rhs.plates
    }
}
