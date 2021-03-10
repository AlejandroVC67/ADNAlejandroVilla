//
//  ParkingListViewModel.swift
//  ADNAlejandroVilla
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 10/03/21.
//

import UIKit
import Domain


class ParkingListViewModel: NSObject {
    private var parkingManager: ParkingRepository.Type
    private var vehicles: [Vehicle] = []
    weak var delegate: ParkingListDelegate?
    
    init(parkingHandler: ParkingRepository.Type) {
        self.parkingManager = parkingHandler
        super.init()
        updateData()
    }
    
    private func updateData() {
        vehicles = parkingManager.getAllVehicles()
    }
    
    func handleCheckout(basedOn plates: String) -> Double {
        let price = parkingManager.exitVehicle(plates: plates)
        updateData()
        return price
    }
}

extension ParkingListViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vehicle = vehicles[indexPath.row]
        let viewModel = ParkingListCellViewModel(vehicle: vehicle)
        let cell = ParkingListViewCell()
        cell.delegate = delegate
        cell.setupView(viewModel: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicles.count
    }
}
