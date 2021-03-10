//
//  FormView.swift
//  ADNAlejandroVilla
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 9/03/21.
//

import UIKit

class FormView: UIScrollView {
    
    private enum Constants {
        static let titlesFont: UIFont? = UIFont.systemFont(ofSize: 18, weight: .bold)
        static let textFieldsPadding: UIEdgeInsets = .init(top: 5, left: 16, bottom: 0, right: -16)
        
        enum PlatesTitle {
            static let text = "Enter Vehicle Plates"
            static let padding: UIEdgeInsets = .init(top: 10, left: 16, bottom: 0, right: -16)
        }
        
        enum CylynderTitle {
            static let text = "Enter Vehicle Cylinder"
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
    
    private lazy var platesTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
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
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    func setupView(delegate: UITextFieldDelegate) {
        platesTextField.delegate = delegate
        cylinderTextField.delegate = delegate
        
        addSubViews([platesTitleLabel/*, platesTextField, cylinderTitleLabel, cylinderTextField*/])
        
        platesTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.PlatesTitle.padding.top).isActive = true
        platesTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.PlatesTitle.padding.left).isActive = true
        platesTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.PlatesTitle.padding.right).isActive = true
    }
}
