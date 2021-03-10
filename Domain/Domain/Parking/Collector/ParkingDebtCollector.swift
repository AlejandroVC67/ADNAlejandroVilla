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
        static let minHoursOfDay: Double = 9
        static let maxHoursOfDay: Double = 24
        static let bikeCylinderCeiling = 500
        static let minHoursBillable: Double = 1
        static let valueZero: Double = 0
    }
    
    private var vehicle: Vehicle
    private var calendar: Calendar
    
    init(vehicle: Vehicle, calendar: Calendar = Calendar(identifier: .gregorian)) {
        self.vehicle = vehicle
        self.calendar = calendar
    }
    
    func calculateCheckout() -> Double {
        var price: Double = ParkingConstants.valueZero
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
        var price: Double = ParkingConstants.valueZero
        
        if  time.days == ParkingConstants.valueZero && time.hours == ParkingConstants.minHoursOfDay {
            price = CarPrices.valueDay
        } else if time.days < 1 && time.hours > ParkingConstants.minHoursOfDay {
            price = CarPrices.valueDay + (time.hours - ParkingConstants.minHoursOfDay) * CarPrices.valueHour
        } else {
            let billableHours = time.hours == 0 ? ParkingConstants.minHoursBillable : time.hours
            price = time.days * CarPrices.valueDay + billableHours * CarPrices.valueHour
        }
        
        return price
    }
    
    private func bikePricePer(time: (days: Double, hours: Double)) -> Double {
        let billableHours = time.hours == 0 ? ParkingConstants.minHoursBillable : time.hours
        return time.days * BikePrices.valueDay + billableHours * BikePrices.valueHour
    }
    
    private func addCylinderCost() -> Double {
        return vehicle.cylinder > ParkingConstants.bikeCylinderCeiling ? BikePrices.cylinderRestriction : 0
    }
}
