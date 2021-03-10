//
//  ParkingFormViewController.swift
//  ADNAlejandroVilla
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 3/03/21.
//

import UIKit
import Domain

class ParkingFormViewController: UIViewController {
    
    private enum Constants {
        static let successActionMessage = "Dismiss"
        static let maxAmountOfCharacter = 6
    }
    
    private lazy var formView: FormView = {
        let view = FormView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var viewModel = ParkingFormViewModel(parkingHandler: ParkingManager.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel.delegate = self
        setupFormView()
    }
    
    private func setupFormView() {
        view.addSubview(formView)
        
        formView.setupView(formUIDelegate: self, formLogicDelegate: viewModel)
        formView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        formView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        formView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        formView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension ParkingFormViewController: ParkingFormViewModelDelegate {
    func showAlert(with message: String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Constants.successActionMessage, style: .default, handler: nil))
        self.present(alert, animated: true)
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
            let shouldEnableButton = count >= Constants.maxAmountOfCharacter ? true : false
            formView.parkInButton.isEnabled = shouldEnableButton
        }
        return count <= Constants.maxAmountOfCharacter
    }
    
    func checkParkedVehicles() {
        print("pushing to anothe vc")
    }
    
}

