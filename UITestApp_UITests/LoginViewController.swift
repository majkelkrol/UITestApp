//
//  LoginViewController.swift
//  UITestApp_UITests
//
//  Created by Majkel on 17/12/2022.
//

import XCTest
@testable import UITestApp

final class LoginViewController: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDownWithError() throws {
    }
    
    func test_LoginViewController_UITestAppLabel_shouldAppearLabel() {
        let label = app.staticTexts["Label"]
        XCTAssertTrue(label.exists)
    }
    
    func test_LoginViewController_signUpButton_shouldSignIn() {
        signIn(shouldTypeData: true)
        signUp(shouldClickLoginButton: true)
        
        let userLabel = app.staticTexts["userLabel"]
        XCTAssertTrue(userLabel.exists)
    }
    
    func test_LoginViewController_signUpButton_shouldNotSignIn() {
        signIn(shouldTypeData: false)
        signUp(shouldClickLoginButton: true)
        
        let userLabel = app.staticTexts["userLabel"]
        XCTAssertFalse(userLabel.exists)
    }
}

extension LoginViewController {
    func signIn(shouldTypeData: Bool) {
        let correctLogin = "Majkel"
        let correctPassword = "1234"
        
        if shouldTypeData {
            let loginTextField = app.textFields["Login"]
            loginTextField.tap()
            loginTextField.typeText(correctLogin)
            
            let passwordTextField = app.secureTextFields["Password"]
            passwordTextField.tap()
            passwordTextField.typeText(correctPassword)
        } else {
            let loginTextField = app.textFields["Login"]
            loginTextField.tap()
            loginTextField.typeText("")
            
            let passwordTextField = app.secureTextFields["Password"]
            passwordTextField.tap()
            passwordTextField.typeText("")
        }
    }
    
    func signUp(shouldClickLoginButton: Bool) {
        if shouldClickLoginButton {
            let logicButton = app.buttons["Button"]
            logicButton.tap()
        }
    }
}

