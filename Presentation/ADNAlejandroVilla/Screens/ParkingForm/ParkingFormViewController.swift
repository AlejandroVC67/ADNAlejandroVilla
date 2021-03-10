//
//  ParkingFormViewController.swift
//  ADNAlejandroVilla
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 3/03/21.
//

import UIKit

class ParkingFormViewController: UIViewController {
    
    private lazy var formView: FormView = {
        let view = FormView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupFormView()
    }
    
    
    private func setupFormView() {
        view.addSubview(formView)
        
        formView.setupView(delegate: self)
        formView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        formView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        formView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        formView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension ParkingFormViewController: UITextFieldDelegate {
    
}

