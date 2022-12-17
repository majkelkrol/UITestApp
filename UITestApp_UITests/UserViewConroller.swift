//
//  UserViewConroller.swift
//  UITestApp_UITests
//
//  Created by Majkel on 17/12/2022.
//

import XCTest
@testable import UITestApp

final class UserViewController: XCTestCase {
    let app = XCUIApplication()
    let loginVC = LoginViewController()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
    }

    func test_UserViewController_HelloUser_shoulAppearLabel() {
        loginVC.test_LoginViewController_signUpButton_shouldSignIn()
        let userLabel = app.staticTexts["userLabel"]
        XCTAssertTrue(userLabel.exists)
    }
    
    func test_UserViewController_showWelcomeAlert_shouldDisplayAlert() {
        loginVC.test_LoginViewController_signUpButton_shouldSignIn()
        tapAlertButton(shouldClickDismissAlert: false)
        
        let alert = app.alerts.firstMatch
        XCTAssertTrue(alert.exists)
        
        let alertOKButton = alert.buttons["OK"]
        XCTAssertTrue(alertOKButton.exists)
    }
    
    func test_UserViewController_showWelcomeAlert_shouldDisplayAndDismissAlert() {
        test_UserViewController_showWelcomeAlert_shouldDisplayAlert()
        tapAlertButton(shouldClickDismissAlert: true)
    
        loginVC.test_LoginViewController_UITestAppLabel_shouldAppearLabel()
    }
}

extension UserViewController {
    func tapAlertButton(shouldClickDismissAlert: Bool) {
        let userAlertButton = app.buttons["alertButton"]
        userAlertButton.tap()
        
        if shouldClickDismissAlert {
            let dismiss = app.buttons["Dismiss"]
            dismiss.tap()
        }
    }
}
