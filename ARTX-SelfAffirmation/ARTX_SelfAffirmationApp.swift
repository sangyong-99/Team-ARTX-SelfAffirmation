//
//  ARTX_SelfAffirmationApp.swift
//  ARTX-SelfAffirmation
//
//  Created by 신상용 on 11/2/23.
//

import SwiftUI
import SwiftData

@main
struct ARTX_SelfAffirmationApp: App {
    
    @AppStorage("isFirstTimeLaunch") private var isFirstTimeLaunch: Bool = true
    @AppStorage("isAlarmActive") var isAlarmActive: Bool = false
    @State private var themeManager = ThemeManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(themeManager)
        }
        .modelContainer(CardContainer.create(shouldCreateDefaults: &isFirstTimeLaunch))
    }
}
