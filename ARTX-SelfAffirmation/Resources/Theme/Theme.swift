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
    var textPrimary: Color { get set }
    var textSecondary: Color { get set }
    var settingPrimary: Color { get set }
    var settingSecondary: Color { get set }
    var tabLine: Color { get set }
    var tabBg: Color { get set }
    var bgDimed: Color { get set }
    var listDivider: Color { get set }
    var pointPrimary: Color { get set }
}
