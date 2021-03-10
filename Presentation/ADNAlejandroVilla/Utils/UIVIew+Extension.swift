//
//  UIVIew+Extension.swift
//  ADNAlejandroVilla
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 10/03/21.
//

import UIKit

extension UIView {
    func addSubViews(_ views: [UIView]) {
        views.forEach {
            self.addSubview($0)
        }
    }
}


extension UITableViewCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}


extension Date {
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm E, d MMM y"
        return formatter.string(from: self)
    }
}
