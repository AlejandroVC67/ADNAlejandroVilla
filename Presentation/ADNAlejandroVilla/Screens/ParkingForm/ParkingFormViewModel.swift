//
//  ParkingFormViewModel.swift
//  ADNAlejandroVilla
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 10/03/21.
//

import Foundation
import Domain

class ParkingFormViewModel {
    
    private var parkingManager: ParkingRepository.Type
    
    init(parkingHandler: ParkingRepository.Type) {
        self.parkingManager = parkingHandler
    }
}


extension ParkingFormViewModel: FormLogicDelegate {
    func handleParkIn(for vehicle: Vehicle) {
        do {
            try parkingManager.add(vehicle: vehicle)
        }
        catch(let error) {
            print(error)
        }
    }
    
}
