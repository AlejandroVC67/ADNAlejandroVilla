//
//  ParkingFormViewController.swift
//  ADNAlejandroVilla
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 3/03/21.
//

import UIKit
import Domain

class ParkingFormViewController: UIViewController {
    
    private lazy var formView: FormView = {
        let view = FormView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupFormView()
    }
    
    private var viewModel = ParkingFormViewModel(parkingHandler: ParkingManager.self)
    
    private func setupFormView() {
        view.addSubview(formView)
        
        formView.setupView(formUIDelegate: self, formLogicDelegate: viewModel)
        formView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        formView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        formView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        formView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension ParkingFormViewController: FormUIDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        if textField == formView.platesTextField {
            let shouldEnableButton = count >= 6 ? true : false
            formView.parkInButton.isEnabled = shouldEnableButton
        }
        return count <= 6
    }
    
    func checkParkedVehicles() {
        print("pushing to anothe vc")
    }
    
}

