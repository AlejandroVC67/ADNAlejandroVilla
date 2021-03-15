//
//  ParkingError.swift
//  Domain
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 8/03/21.
//

import Foundation

public enum ParkingError: Error {
    case noCarAvailability
    case noBikeAvailability
    case unableToEnter
    case duplicatePlates
    
    public var errorDescription: String {
        switch self {
        case .noCarAvailability: return "Our car availability is full, please come back later"
        case .noBikeAvailability: return "Our bike availability is full, please come back later"
        case .unableToEnter: return "Your Vehicle can't enter today"
        case .duplicatePlates: return "There is already a parked vehicle with the same plates"
        }
    }
        
}
