//
//  Car.swift
//  Domain
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 8/03/21.
//

import Foundation

public struct Vehicle: Identifiable, Billable {
    private enum CarPrices {
        static let valueHour: Double = 1000
        static let valueDay: Double = 8000
    }
    
    private enum BikePrices {
        static let valueHour: Double = 500
        static let valueDay: Double = 4000
        static let cylinderRestriction: Double = 2000
    }
    
    private enum ParkingConstants {
        static let minHoursOfDay: Double = 9
        static let maxHoursOfDay: Double = 24
        static let bikeCylinderCeiling = 500
        static let minHoursBillable: Double = 1
        static let valueZero: Double = 0
    }
    
    // MARK: - Identifiable
    public let plates: String
    public let type: VehicleType
    public let cylinder: Int
    
    //MARK: - Billable
    public let startDate: Date
        
    public init(plates: String, type: VehicleType, cylinder: Int, startDate: Date = Date()) throws {
        self.plates = plates
        self.type = type
        self.cylinder = cylinder
        self.startDate = startDate
        try checkPlates()
    }
    
    // MARK: - Identifiable functions
    func checkPlates() throws {
        let weekDayNumber = Calendar.current.component(.weekday, from: startDate)
        guard let day = WeekDay(rawValue: weekDayNumber) else {
            throw ParkingError.unableToEnter
        }
        
        guard let firstLetter = plates.first else {
            throw ParkingError.unableToEnter
        }
        
        if firstLetter == "A" && (day != .monday && day != .sunday) {
            throw ParkingError.unableToEnter
        }
    }
    
    // MARK: - Billable functions
    func calculateCheckout() -> Double {
        var price: Double = ParkingConstants.valueZero
        let parkedTime = getParkedTime()
        
        switch self.type {
        case .car:
            price += carPricePer(time: parkedTime)
        case .bike:
            price += bikePricePer(time: parkedTime)
            price += addCylinderCost()
        }
        
        return price
    }
    
    func getParkedTime() -> (days: Double, hours: Double) {
        let calendar = Calendar(identifier: .gregorian)
        let dayComponents = calendar.dateComponents([.day, .hour], from: self.startDate, to: Date())
        let days = dayComponents.day ?? 0
        let hours = dayComponents.hour ?? 1
        
        return (Double(days), Double(hours))
    }
    
    func carPricePer(time: (days: Double, hours: Double)) -> Double {
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
    
    func bikePricePer(time: (days: Double, hours: Double)) -> Double {
        let billableHours = time.hours == 0 ? ParkingConstants.minHoursBillable : time.hours
        return time.days * BikePrices.valueDay + billableHours * BikePrices.valueHour
    }
    
    func addCylinderCost() -> Double {
        return self.cylinder > ParkingConstants.bikeCylinderCeiling ? BikePrices.cylinderRestriction : 0
    }
}
