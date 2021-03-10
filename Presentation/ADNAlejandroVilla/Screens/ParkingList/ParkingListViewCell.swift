//
//  ParkingListViewCell.swift
//  ADNAlejandroVilla
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 10/03/21.
//

import UIKit

protocol ParkingListDelegate: class {
    func exitVehicle(plates: String)
}

class ParkingListViewCell: UITableViewCell {
    private enum Constants {
        static let titleAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .bold)]
        
        enum Plates {
            static let title = "Plates: "
            static let padding: UIEdgeInsets = .init(top: 10, left: 16, bottom: 0, right: -16)
        }
        
        enum VehicleType {
            static let title = "Type: "
            static let padding: UIEdgeInsets = .init(top: 10, left: 16, bottom: 0, right: -16)
        }
        
        enum Cylinder {
            static let title = "Cylinder: "
            static let padding: UIEdgeInsets = .init(top: 10, left: 16, bottom: 0, right: -16)
        }
        
        enum Date {
            static let title = "Parked Since: "
            static let padding: UIEdgeInsets = .init(top: 10, left: 16, bottom: 0, right: -16)
        }
        
        enum Remove {
            static let title = "Remove Vehicle"
            static let padding: UIEdgeInsets = .init(top: 10, left: 16, bottom: -10, right: -16)
        }
    }
    
    private lazy var platesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var vehicleTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cylinderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var removeVehicleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.setTitle(Constants.Remove.title, for: .normal)
        button.addTarget(self, action: #selector(self.removeVehicle(_:)), for: .touchDown)
        return button
    }()
    
    weak var delegate: ParkingListDelegate?
    private var viewModel: ParkingListCellViewModel?
    
    func setupView(viewModel: ParkingListCellViewModel) {
        contentView.addSubViews([platesLabel, vehicleTypeLabel, cylinderLabel, dateLabel, removeVehicleButton])
        self.viewModel = viewModel
        
        guard let viewModel = self.viewModel else {
            return
        }
        
        platesLabel.attributedText = configureLabel(title: Constants.Plates.title, text: viewModel.plates)
        vehicleTypeLabel.attributedText = configureLabel(title: Constants.VehicleType.title, text: viewModel.type)
        cylinderLabel.attributedText = configureLabel(title: Constants.Cylinder.title, text: viewModel.cylinder)
        dateLabel.attributedText = configureLabel(title: Constants.Date.title, text: viewModel.startDate)
     
        setupPlatesLabelConstraints()
        setupVehicleTypeLabelConstraints()
        setupCylinderLabelLabelConstraints()
        setupDateLabelConstraints()
        setupRemoveVehicleConstraints()
    }
    
    @objc private func removeVehicle(_ sender: UIButton) {
        guard let plates = viewModel?.plates else {
            return
        }
        
        delegate?.exitVehicle(plates: plates)
    }
    
    private func configureLabel(title: String, text: String) -> NSAttributedString {
        let attributedTitle = NSMutableAttributedString(string: title, attributes: Constants.titleAttributes)
        let attributedValue = NSMutableAttributedString(string: text)
        attributedTitle.append(attributedValue)
        return attributedTitle
    }
    
    private func setupPlatesLabelConstraints() {
        platesLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.Plates.padding.top).isActive = true
        platesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.Plates.padding.left).isActive = true
        platesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.Plates.padding.right).isActive = true
    }
    
    private func setupVehicleTypeLabelConstraints() {
        vehicleTypeLabel.topAnchor.constraint(equalTo: platesLabel.bottomAnchor, constant: Constants.VehicleType.padding.top).isActive = true
        vehicleTypeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.VehicleType.padding.left).isActive = true
        vehicleTypeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.VehicleType.padding.right).isActive = true
    }
    
    private func setupCylinderLabelLabelConstraints() {
        cylinderLabel.topAnchor.constraint(equalTo: vehicleTypeLabel.bottomAnchor, constant: Constants.Cylinder.padding.top).isActive = true
        cylinderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.Cylinder.padding.left).isActive = true
        cylinderLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.Cylinder.padding.right).isActive = true
    }
    
    private func setupDateLabelConstraints() {
        dateLabel.topAnchor.constraint(equalTo: cylinderLabel.bottomAnchor, constant: Constants.Date.padding.top).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.Date.padding.left).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.Date.padding.right).isActive = true
    }
    
    private func setupRemoveVehicleConstraints() {
        removeVehicleButton.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: Constants.Remove.padding.top).isActive = true
        removeVehicleButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.Remove.padding.left).isActive = true
        removeVehicleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.Remove.padding.right).isActive = true
        removeVehicleButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.Remove.padding.bottom).isActive = true
    }
}
