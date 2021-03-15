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
        let page = ParkingFormPage(app: XCUIApplication())
        
        // When
        page.app.launch()
        
        // Then
        XCTAssertTrue(page.platesTextField.exists, "The textfield should exist")
    }
    
    func testCylinderTextFieldExist() {
        // Given
        let page = ParkingFormPage(app: XCUIApplication())
        
        // When
        page.app.launch()
        
        // Then
        XCTAssertTrue(page.cylinderTextField .exists, "The textfield should exist")
    }
    
    func testParkInButtonExist() {
        // Given
        let page = ParkingFormPage(app: XCUIApplication())
        
        // When
        page.app.launch()
        
        // Then
        XCTAssertTrue(page.parkInButton.exists, "The button should exist")
    }
    
    func testCheckParkedVehiclesButtonExist() {
        // Given
        let page = ParkingFormPage(app: XCUIApplication())
        
        // When
        page.app.launch()
        
        // Then
        XCTAssertTrue(page.checkParkedVehiclesButton.exists, "The button should exist")
    }
    
    func testCheckBikeSegmentedControlExist() {
        // Given
        let page = ParkingFormPage(app: XCUIApplication())
        
        // When
        page.app.launch()
        
        // Then
        XCTAssertTrue(page.bikeSegmentedControl.exists, "The segmented control should exist")
    }
    
    func testCheckCarSegmentedControlExist() {
        // Given
        let page = ParkingFormPage(app: XCUIApplication())
        
        // When
        page.app.launch()
        
        // Then
        XCTAssertTrue(page.carSegmentedControl.exists, "The segmented control should exist")
    }
    
    func testFlow() {
        // Given
        let application = XCUIApplication()
        let page = ParkingFormPage(app: application)
        let parkingListPage = ParkingListUIElements(app: application)
        
        // When
        page.app.launch()
        page.platesTextField.tap()
        page.platesTextField.typeText("QQQ789")
        page.cylinderTextField.tap()
        page.cylinderTextField.typeText("200")
        page.bikeSegmentedControl.tap()
        page.parkInButton.tap()
        
        // Then
        if page.successAlert.exists {
            page.successAlertDismiss.tap()
        }
        
        XCTAssertTrue(parkingListPage.screen.exists, "User reached list screen")
    }
}
