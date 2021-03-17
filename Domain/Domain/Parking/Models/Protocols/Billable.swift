//
//  Billable.swift
//  Domain
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 9/03/21.
//

import Foundation

protocol Billable {
    var startDate: Date { get }
    
    func calculateCheckout() -> Double
    func getParkedTime() -> (days: Double, hours: Double)
    func carPricePer(time: (days: Double, hours: Double)) -> Double
    func bikePricePer(time: (days: Double, hours: Double)) -> Double
    func addCylinderCost() -> Double
}
