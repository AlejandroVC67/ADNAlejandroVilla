//
//  ParkingListCellViewModel.swift
//  ADNAlejandroVilla
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 10/03/21.
//

import Foundation
import Domain

struct ParkingListCellViewModel {
    let plates: String
    let cylinder: String
    let type: String
    let startDate: String
    
    init(vehicle: Vehicle) {
        self.plates = vehicle.plates
        self.cylinder = String(vehicle.cylinder)
        self.type = vehicle.type.rawValue
        self.startDate = vehicle.startDate.formattedDate
    }
}
