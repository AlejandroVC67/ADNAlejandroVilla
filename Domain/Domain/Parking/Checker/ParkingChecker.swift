//
//  ParkingChecker.swift
//  Domain
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 8/03/21.
//

import Foundation

protocol ParkingCheckerProtocol {
    static func canPark(parkedVehicles: [Vehicle], vehicle: Vehicle) -> Result<Bool, ParkingError>
    static func checkAvailability(parkedVehicles: [Vehicle], type: VehicleType) -> Result<Bool, ParkingError>
    static func checkPlates(vehicle: Vehicle) -> Result<Bool, ParkingError>
}

class ParkingChecker: ParkingCheckerProtocol {
    private enum Constants {
        static let maxAmountOfCars = 20
        static let maxAmountOfBikes = 10
        static let letterA: Character = "A"
    }
    
    static func canPark(parkedVehicles: [Vehicle], vehicle: Vehicle) -> Result<Bool, ParkingError> {
        let isAParkingAvailable = checkAvailability(parkedVehicles: parkedVehicles, type: vehicle.type)
        let platesValidation = checkPlates(vehicle: vehicle)
        
        guard let _ = check(validation: isAParkingAvailable) else {
            return isAParkingAvailable
        }
        
        guard let _ = check(validation: platesValidation) else {
            return platesValidation
        }
        
        return .success(true)
    }
    
    static func checkAvailability(parkedVehicles: [Vehicle], type: VehicleType) -> Result<Bool, ParkingError> {
        let matchingType = parkedVehicles.filter { $0.type == type }
        
        switch type {
        case .car:
            let result = matchingType.count < Constants.maxAmountOfCars
            return result ? .success(result) : .failure(.noCarAvailability)
        case .bike:
            let result = matchingType.count < Constants.maxAmountOfBikes
            return result ? .success(result) : .failure(.noBikeAvailability)
        }
    }
    
    static func checkPlates(vehicle: Vehicle) -> Result<Bool, ParkingError> {
        let weekDayNumber = Calendar.current.component(.weekday, from: Date())
        guard let day = WeekDay(rawValue: weekDayNumber) else {
            return .failure(.unableToEnter)
        }
        
        guard let firstLetter = vehicle.plates.first else {
            return .failure(.unableToEnter)
        }
        
        if firstLetter == Constants.letterA && day != .monday || day != .sunday {
            return.failure(.unableToEnter)
        }
        
        return .success(true)
    }
    
    
    private static func check(validation: Result<Bool, ParkingError>) -> Bool? {
        guard let _ = try? validation.get() else {
            return nil
        }
        
        return true
    }
    
}