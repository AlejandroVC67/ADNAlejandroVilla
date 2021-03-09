//
//  Car.swift
//  Domain
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 8/03/21.
//

import Foundation

public struct Vehicle: Identifiable {
    // MARK: - Identifiable
    let plates: String
    let brand: String
    let type: VehicleType
    let cylinder: Int
}
