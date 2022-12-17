//
//  DarkMode.swift
//  UITestApp_UITests
//
//  Created by Majkel on 17/12/2022.
//

import XCTest
@testable import UITestApp

final class DarkMode: XCTestCase {
    
    func test_UITestApp_darkMode_shouldToggleLayout() {
        let settings = XCUIApplication(bundleIdentifier: "com.apple.Preferences")
        settings.launch()
        
        settings.tables.cells.staticTexts["Deweloper"].tap()
        settings.switches["Wygląd ciemny"].tap()
    }
}
