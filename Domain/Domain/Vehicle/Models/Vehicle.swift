//
//  Car.swift
//  Domain
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 8/03/21.
//

import Foundation

public struct Vehicle: Identifiable, Billable {
    // MARK: - Identifiable
    public let plates: String
    public let type: VehicleType
    public let cylinder: Int
    
    //MARK: - Billable
    public let startDate: Date
        
    public init(plates: String, type: VehicleType, cylinder: Int, startDate: Date = Date()) {
        self.plates = plates
        self.type = type
        self.cylinder = cylinder
        self.startDate = startDate
    }
}
