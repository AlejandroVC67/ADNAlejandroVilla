//
//  ParkingFormViewModel.swift
//  ADNAlejandroVilla
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 10/03/21.
//

import Foundation
import Domain

protocol ParkingFormViewModelDelegate: class {
    func showAlert(with message: String)
}

class ParkingFormViewModel {
    
    private var parkingManager: ParkingService
    weak var delegate: ParkingFormViewModelDelegate?
    
    init(parkingHandler: ParkingService) {
        self.parkingManager = parkingHandler
    }
}

extension ParkingFormViewModel: FormLogicDelegate {
    func handleParkIn(for vehicle: Vehicle) {
        let didPark = parkingManager.add(vehicle: vehicle)
        switch didPark {
        case .success(let message): delegate?.showAlert(with: message)
        case .failure(let error): delegate?.showAlert(with: error.errorDescription)
        }
    }
}
