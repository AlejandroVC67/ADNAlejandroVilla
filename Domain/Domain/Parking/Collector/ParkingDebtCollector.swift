//
//  ParkingDebtCollector.swift
//  Domain
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 9/03/21.
//

import Foundation

class ParkingDebtCollector {
    enum CarPrices {
        static let valueHour: Double = 1000
        static let valueDay: Double = 8000
    }
    
    enum BikePrices {
        static let valueHour: Double = 500
        static let valueDay: Double = 4000
        static let cylinderRestriction: Double = 2000
    }
    
    enum ParkingConstants {
        static let minHoursOfDay = 9
        static let maxHoursOfDay = 24
        static let bikeCylinderCeiling = 500
    }
    
    private var vehicle: Vehicle
    private var calendar: Calendar
    
    init(vehicle: Vehicle, calendar: Calendar = Calendar(identifier: .gregorian)) {
        self.vehicle = vehicle
        self.calendar = calendar
    }
    
    func calculateCheckout() -> Double {
        var price: Double = 0
        let parkedTime = getParkedTime()
        
        switch vehicle.type {
        case .car:
            price += carPricePer(time: parkedTime)
        case .bike:
            price += bikePricePer(time: parkedTime)
            price += addCylinderCost()
        }
        
        return price
    }
    
    private func getParkedTime() -> (days: Double, hours: Double) {
        let dayComponents = calendar.dateComponents([.day, .hour], from: vehicle.startDate, to: Date())
        let days = dayComponents.day ?? 0
        let hours = dayComponents.hour ?? 1
        
        return (Double(days), Double(hours))
    }
    
    private func carPricePer(time: (days: Double, hours: Double)) -> Double {
        var price: Double = 0
        
        if  time.days == 0 && time.hours == 9 {
            price = CarPrices.valueDay
        } else if time.days < 1 && time.hours > 9 {
            price = CarPrices.valueDay + (time.hours - 9) * CarPrices.valueHour
        } else {
            price = time.days * CarPrices.valueDay + time.hours * CarPrices.valueHour
        }
        
        return price
    }
    
    private func bikePricePer(time: (days: Double, hours: Double)) -> Double {
        return time.days * BikePrices.valueDay + time.hours * BikePrices.valueHour
    }
    
    private func addCylinderCost() -> Double {
        return vehicle.cylinder > ParkingConstants.bikeCylinderCeiling ? BikePrices.cylinderRestriction : 0
    }
}
