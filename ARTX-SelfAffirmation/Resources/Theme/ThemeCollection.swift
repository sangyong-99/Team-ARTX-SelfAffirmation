//
//  ThemeCollection.swift
//  ARTX-SelfAffirmation
//
//  Created by Jae Ho Yoon on 11/2/23.
//

import SwiftUI

class DefaultTheme {
    var pageBg = LinearGradient(
        stops: [
        Gradient.Stop(color: Color(hex: "292462"), location: 0.00),
        Gradient.Stop(color: Color(hex: "250A22"), location: 1.00),
        ],
        startPoint: UnitPoint(x: 0.5, y: 0),
        endPoint: UnitPoint(x: 0.5, y: 1)
        )
    var settingPrimary = Color(hex: "F7F7F7")
    var settingSecondary = Color(hex: "F7F7F7", opacity: 0.7)
    var tabLine = Color(hex: "FFFFFF", opacity: 0.3)
    var tabBg = Color(hex: "FFFFFF", opacity: 0.1)
    var bgDimed = Color(hex: "FFFFFF", opacity: 0.1)
    var listDivider = Color(hex: "FFFFFF", opacity: 0.4)
    var pointPrimary = Color(hex: "B95AB8", opacity: 0.7)
}

final class LightTheme: DefaultTheme, Theme {
    var themeName: String = "Light Theme"
    var textPrimary = Color(hex: "262626")
    var textSecondary = Color(hex: "262626", opacity: 0.7)
    var textDeactive = Color(hex: "262626", opacity: 0.35)
}

final class DarkTheme: DefaultTheme, Theme {
    var themeName: String = "Dark Theme"
    var textPrimary = Color(hex: "F7F7F7")
    var textSecondary = Color(hex: "F7F7F7", opacity: 0.7)
    var textDeactive = Color(hex: "F7F7F7", opacity: 0.35)
}
