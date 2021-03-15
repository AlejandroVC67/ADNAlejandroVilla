//
//  VehicleType.swift
//  Domain
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 8/03/21.
//

import Foundation

public enum VehicleType: String, CaseIterable {
    case car, bike
    
    public static func toString() -> [String] {
        var types: [String] = []
        
        VehicleType.allCases.forEach {
            types.append($0.rawValue)
        }
        
        return types
    }
}
