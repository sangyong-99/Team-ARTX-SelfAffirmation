//
//  ARTX_SelfAffirmationApp.swift
//  ARTX-SelfAffirmation
//
//  Created by 신상용 on 11/2/23.
//

import SwiftUI

@main
struct ARTX_SelfAffirmationApp: App {
    
    @State private var themeManager = ThemeManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(themeManager)
        }
    }
}
