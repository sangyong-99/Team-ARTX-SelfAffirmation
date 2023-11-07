//
//  ThemeCollection.swift
//  ARTX-SelfAffirmation
//
//  Created by Jae Ho Yoon on 11/2/23.
//

import SwiftUI

final class LightTheme: Theme {
    var themeName: String = "Default Theme"
    
    var pageBg = LinearGradient(
        stops: [
        Gradient.Stop(color: Color(hex: "292462"), location: 0.00),
        Gradient.Stop(color: Color(hex: "250A22"), location: 1.00),
        ],
        startPoint: UnitPoint(x: 0.5, y: 0),
        endPoint: UnitPoint(x: 0.5, y: 1)
        )
    var textLightPrimary = Color(hex: "262626")
    var textLightSecondary = Color(hex: "262626", opacity: 0.7)
    var textDarkPrimary = Color(hex: "F7F7F7")
    var textDarkSecondary = Color(hex: "F7F7F7", opacity: 0.7)
    var tabLine = Color(hex: "FFFFFF", opacity: 0.3)
    var tabBg = Color(hex: "FFFFFF", opacity: 0.1)
    var bgDimed = Color(hex: "FFFFFF", opacity: 0.1)
    var listDivider = Color(hex: "FFFFFF", opacity: 0.4)
    var pointPrimary = Color(hex: "B95AB8", opacity: 0.7)
    
}

final class DarkTheme: Theme {
    var themeName: String = "Default Theme"
    
    var pageBg = LinearGradient(
        stops: [
        Gradient.Stop(color: Color(hex: "292462"), location: 0.00),
        Gradient.Stop(color: Color(hex: "250A22"), location: 1.00),
        ],
        startPoint: UnitPoint(x: 0.5, y: 0),
        endPoint: UnitPoint(x: 0.5, y: 1)
        )
    var textLightPrimary = Color(hex: "F7F7F7")
    var textLightSecondary = Color(hex: "F7F7F7", opacity: 0.7)
    var textDarkPrimary = Color(hex: "F7F7F7")
    var textDarkSecondary = Color(hex: "F7F7F7", opacity: 0.7)
    var tabLine = Color(hex: "FFFFFF", opacity: 0.3)
    var tabBg = Color(hex: "FFFFFF", opacity: 0.1)
    var bgDimed = Color(hex: "FFFFFF", opacity: 0.1)
    var listDivider = Color(hex: "FFFFFF", opacity: 0.4)
    var pointPrimary = Color(hex: "B95AB8", opacity: 0.7)
    
}
