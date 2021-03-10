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
}
