//
//  ADNAlejandroVillaUITests.swift
//  ADNAlejandroVillaUITests
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 3/03/21.
//

import XCTest

class ParkingFormUITests: XCTestCase {
    func testPlatesTextFieldExist() {
        // Given
        let parkingFormElements = ParkingFormUIElements(app: XCUIApplication())
        
        // When
        parkingFormElements.app.launch()
        
        // Then
        XCTAssertTrue(parkingFormElements.platesTextField.exists, "The textfield should exist")
    }
    
    func testCylinderTextFieldExist() {
        // Given
        let parkingFormElements = ParkingFormUIElements(app: XCUIApplication())
        
        // When
        parkingFormElements.app.launch()
        
        // Then
        XCTAssertTrue(parkingFormElements.cylinderTextField .exists, "The textfield should exist")
    }
    
    func testParkInButtonExist() {
        // Given
        let parkingFormElements = ParkingFormUIElements(app: XCUIApplication())
        
        // When
        parkingFormElements.app.launch()
        
        // Then
        XCTAssertTrue(parkingFormElements.parkInButton.exists, "The button should exist")
    }
    
    func testCheckParkedVehiclesButtonExist() {
        // Given
        let parkingFormElements = ParkingFormUIElements(app: XCUIApplication())
        
        // When
        parkingFormElements.app.launch()
        
        // Then
        XCTAssertTrue(parkingFormElements.checkParkedVehiclesButton.exists, "The button should exist")
    }
    
    func testCheckBikeSegmentedControlExist() {
        // Given
        let parkingFormElements = ParkingFormUIElements(app: XCUIApplication())
        
        // When
        parkingFormElements.app.launch()
        
        // Then
        XCTAssertTrue(parkingFormElements.bikeSegmentedControl.exists, "The segmented control should exist")
    }
    
    func testCheckCarSegmentedControlExist() {
        // Given
        let parkingFormElements = ParkingFormUIElements(app: XCUIApplication())
        
        // When
        parkingFormElements.app.launch()
        
        // Then
        XCTAssertTrue(parkingFormElements.carSegmentedControl.exists, "The segmented control should exist")
    }
    
    func testFlow() {
        // Given
        let application = XCUIApplication()
        let parkingFormElements = ParkingFormUIElements(app: application)
        let parkingListElements = ParkingListUIElements(app: application)
        
        // When
        parkingFormElements.app.launch()
        parkingFormElements.platesTextField.tap()
        parkingFormElements.platesTextField.typeText("QQQ789")
        parkingFormElements.cylinderTextField.tap()
        parkingFormElements.cylinderTextField.typeText("200")
        parkingFormElements.bikeSegmentedControl.tap()
        parkingFormElements.parkInButton.tap()
        
        // Then
        if parkingFormElements.successAlert.exists {
            parkingFormElements.successAlertDismiss.tap()
        }
        
        XCTAssertTrue(parkingListElements.screen.exists, "User reached list screen")
    }
}
