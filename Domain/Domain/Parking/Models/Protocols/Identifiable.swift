//
//  Identifiable.swift
//  Domain
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 8/03/21.
//

import Foundation

protocol Identifiable {
    var plates: String { get }
    var type: VehicleType { get }
    var cylinder: Int { get }
    
    func checkPlates() throws
}