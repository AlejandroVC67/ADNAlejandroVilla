//
//  ParkingListTableViewController.swift
//  ADNAlejandroVilla
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 10/03/21.
//

import UIKit

class ParkingListTableViewController: UITableViewController {

    private var viewModel: ParkingListViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Parked Vehicles"
        setupTableView()
    }

    init(viewModel: ParkingListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        tableView.dataSource = viewModel
        tableView.allowsSelection = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(ParkingListViewCell.self, forCellReuseIdentifier: ParkingListViewCell.reuseIdentifier)
    }
    
    private func showCheckout(with price: Double) {
        let alert = UIAlertController(title: "User needs to pay \(price) COP", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Approve exit", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}

extension ParkingListTableViewController: ParkingListDelegate {
    func exitVehicle(plates: String) {
        let price = viewModel.handleCheckout(basedOn: plates)
        showCheckout(with: price)
        tableView.reloadData()
    }
}
