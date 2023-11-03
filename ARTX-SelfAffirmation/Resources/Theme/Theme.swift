//
//  Theme.swift
//  ARTX-SelfAffirmation
//
//  Created by Jae Ho Yoon on 11/2/23.
//

import SwiftUI

protocol Theme {
    var themeName: String { get set }
    
    var pageBg: LinearGradient { get set }
    var textLightPrimary: Color { get set }
    var textLightSecondary: Color { get set }
    var textDarkPrimary: Color { get set }
    var textDarkSecondary: Color { get set }
    var tabLine: Color { get set }
    var tabBg: Color { get set }
    var bgDimed: Color { get set }
    var listDivider: Color { get set }
    var pointPrimary: Color { get set }
}
