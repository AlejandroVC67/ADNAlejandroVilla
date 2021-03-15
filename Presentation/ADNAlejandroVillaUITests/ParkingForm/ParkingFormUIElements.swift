//
//  ParkingFormUIElements.swift
//  ADNAlejandroVillaUITests
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 15/03/21.
//

import XCTest

class ParkingFormUIElements {

    var app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var platesTextField: XCUIElement {
        return app.scrollViews.children(matching: .textField).element(boundBy: 0)
    }
    
    var cylinderTextField: XCUIElement {
        return app.scrollViews.containing(.staticText, identifier: "Enter Vehicle Cylinder").children(matching: .textField).element(boundBy: 1)
    }
    
    var bikeSegmentedControl: XCUIElement {
        return app.segmentedControls.buttons["bike"]
    }
    
    var carSegmentedControl: XCUIElement {
        return app.segmentedControls.buttons["car"]
    }
    
    var parkInButton: XCUIElement {
        return app.buttons["Check Parked Vehicles"]
    }
    
    var checkParkedVehiclesButton: XCUIElement {
        return app.buttons["Park In"]
    }
    
    var successAlert: XCUIElement {
        return app.alerts["Successfully added vehicle"]
    }
    
    var successAlertDismiss: XCUIElement {
        return successAlert.scrollViews.otherElements.buttons["Dismiss"]
    }
}
