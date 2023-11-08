//
//  ThemeManager.swift
//  ARTX-SelfAffirmation
//
//  Created by Jae Ho Yoon on 11/2/23.
//

import SwiftUI

@Observable
final class ThemeManager {
    
    @ObservationIgnored @AppStorage("selectedTheme") var themeSelected = 0
    
    static let shared = ThemeManager()
    public var themes: [Theme] = [LightTheme(), DarkTheme()]
    var selectedTheme: Theme = LightTheme()
    
    init() {
        getTheme()
    }
    
    public func applyTheme(_ theme: Int) {
        self.selectedTheme = self.themes[theme]
        self.themeSelected = theme
    }
    
    func getTheme() {
        self.selectedTheme = self.themes[themeSelected]
    }
 }
