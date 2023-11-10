//
//  Color+Util.swift
//  ARTX-SelfAffirmation
//
//  Created by Jae Ho Yoon on 11/2/23.
//

import SwiftUI

extension Color {
    init(hex: String, opacity: Double = 1.0) {
        let hexCode: Int = Int(hex, radix: 16)!
        let red = Double((hexCode >> 16) & 0xff) / 255
        let green = Double((hexCode >> 8) & 0xff) / 255
        let blue = Double((hexCode >> 0) & 0xff) / 255

        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}
