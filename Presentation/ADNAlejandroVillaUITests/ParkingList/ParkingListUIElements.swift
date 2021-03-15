//
//  ParkingListUIElements.swift
//  ADNAlejandroVillaUITests
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 15/03/21.
//

import XCTest

class ParkingListUIElements {
    
    var app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var screen: XCUIElement {
        return app.navigationBars["Parked Vehicles"]
    }
}
