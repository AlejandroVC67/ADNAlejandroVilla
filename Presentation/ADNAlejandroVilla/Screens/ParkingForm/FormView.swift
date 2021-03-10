//
//  FormView.swift
//  ADNAlejandroVilla
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 9/03/21.
//

import UIKit
import Domain

protocol FormDelegate: class {
    func handleParkIn()
    func checkParkedVehicles()
}

class FormView: UIScrollView {
    
    private enum Constants {
        static let titlesFont: UIFont? = UIFont.systemFont(ofSize: 35, weight: .bold)
        static let textFieldsPadding: UIEdgeInsets = .init(top: 5, left: 16, bottom: 0, right: -16)
        
        enum PlatesTitle {
            static let text = "Enter Vehicle Plates"
            static let padding: UIEdgeInsets = .init(top: 10, left: 16, bottom: 0, right: -16)
        }
        
        enum CylynderTitle {
            static let text = "Enter Vehicle Cylinder"
            static let padding: UIEdgeInsets = .init(top: 30, left: 16, bottom: 0, right: -16)
        }
        
        enum ParkInButton {
            static let text = "Park In"
            static let padding: UIEdgeInsets = .init(top: 30, left: 16, bottom: 0, right: -16)
        }
        
        enum ParkedListButton {
            static let text = "Check Parked Cars"
            static let padding: UIEdgeInsets = .init(top: 30, left: 16, bottom: -20, right: -16)
        }
        
        enum SegmentedControl {
            static let padding: UIEdgeInsets = .init(top: 10, left: 16, bottom: 0, right: -16)
        }
    }
    
    private lazy var platesTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Constants.titlesFont
        label.text = Constants.PlatesTitle.text
        return label
    }()
    
    private(set) lazy var platesTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 8
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.masksToBounds = true
        textField.keyboardType = .alphabet
        textField.autocapitalizationType = .allCharacters
        return textField
    }()
    
    private lazy var cylinderTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Constants.titlesFont
        label.text = Constants.CylynderTitle.text
        return label
    }()
    
    private lazy var cylinderTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 8
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.masksToBounds = true
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: VehicleType.toString())
        control.translatesAutoresizingMaskIntoConstraints = false
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(self.selectVehicle(_:)), for: .valueChanged)
        return control
    }()
    
    private(set) lazy var parkInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .lightGray
        button.setTitleColor(.gray, for: .disabled)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.isEnabled = false
        button.setTitle(Constants.ParkInButton.text, for: .normal)
        button.addTarget(self, action: #selector(self.validateAndPark(_:)), for: .touchDown)
        return button
    }()
    
    private lazy var parkedListButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .magenta
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.setTitle(Constants.ParkedListButton.text, for: .normal)
        button.addTarget(self, action: #selector(self.checkParkedVehicles(_:)), for: .touchDown)
        return button
    }()
    
    private weak var textFieldDelegate: UITextFieldDelegate?
    private weak var formDelegate: FormDelegate?
    
    func setupView(delegate: UITextFieldDelegate) {
        textFieldDelegate = delegate
        platesTextField.delegate = textFieldDelegate
        cylinderTextField.delegate = textFieldDelegate
        
        addSubViews([platesTitleLabel, platesTextField, cylinderTitleLabel, cylinderTextField, segmentedControl, parkInButton, parkedListButton])
        
        addPlatesTitleConstraints()
        addPlatesTextFieldConstraints()
        adddCylinderTitleConstraints()
        addCylinderTextFieldConstraints()
        addSegmentedControlConstraints()
        addParkInConstraints()
        addParkedListConstraints()
    }
    
    @objc private func selectVehicle(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("car")
            break
        case 1:
            print("bike")
            break
        default: break
        }
    }
    
    @objc private func validateAndPark(_ sender: UIButton) {
        formDelegate?.handleParkIn()
    }
    
    @objc private func checkParkedVehicles(_ sender: UIButton) {
        formDelegate?.checkParkedVehicles()
    }
    
    private func addPlatesTitleConstraints() {
        platesTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.PlatesTitle.padding.top).isActive = true
        platesTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.PlatesTitle.padding.left).isActive = true
        platesTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.PlatesTitle.padding.right).isActive = true
    }
    
    private func addPlatesTextFieldConstraints() {
        platesTextField.topAnchor.constraint(equalTo: platesTitleLabel.bottomAnchor, constant: Constants.textFieldsPadding.top).isActive = true
        platesTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.textFieldsPadding.left).isActive = true
        platesTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.textFieldsPadding.right).isActive = true
    }
    
    private func adddCylinderTitleConstraints() {
        cylinderTitleLabel.topAnchor.constraint(equalTo: platesTextField.bottomAnchor, constant: Constants.CylynderTitle.padding.top).isActive = true
        cylinderTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.CylynderTitle.padding.left).isActive = true
        cylinderTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.CylynderTitle.padding.right).isActive = true
    }
    
    private func addCylinderTextFieldConstraints() {
        cylinderTextField.topAnchor.constraint(equalTo: cylinderTitleLabel.bottomAnchor, constant: Constants.textFieldsPadding.top).isActive = true
        cylinderTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.textFieldsPadding.left).isActive = true
        cylinderTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.textFieldsPadding.right).isActive = true
    }
    
    private func addSegmentedControlConstraints() {
        segmentedControl.topAnchor.constraint(equalTo: cylinderTextField.bottomAnchor, constant: Constants.SegmentedControl.padding.top).isActive = true
        segmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.SegmentedControl.padding.left).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.SegmentedControl.padding.right).isActive = true
    }
    
    private func addParkInConstraints() {
        parkInButton.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: Constants.ParkInButton.padding.top).isActive = true
        parkInButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.ParkInButton.padding.left).isActive = true
        parkInButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.ParkInButton.padding.right).isActive = true
    }
    
    private func addParkedListConstraints() {
        parkedListButton.topAnchor.constraint(equalTo: parkInButton.bottomAnchor, constant: Constants.ParkedListButton.padding.top).isActive = true
        parkedListButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.ParkedListButton.padding.left).isActive = true
        parkedListButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.ParkedListButton.padding.right).isActive = true
        parkedListButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.ParkedListButton.padding.bottom).isActive = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        platesTextField.endEditing(true)
        cylinderTextField.endEditing(true)
    }
}
