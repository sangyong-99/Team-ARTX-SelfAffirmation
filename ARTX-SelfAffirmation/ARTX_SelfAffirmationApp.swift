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
    @State var currentPage = 0
    @AppStorage("isFirstTimeLaunch") private var isFirstTimeLaunch: Bool = true
    @AppStorage("isAlarmActive") var isAlarmActive: Bool = false
    @State private var themeManager = ThemeManager()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if (currentPage == 0) {
                    ContentView()
                        .environment(themeManager)
                }
                if (currentPage == 2) {
                    SettingView(currentPage: $currentPage)
                        .environment(themeManager)
                }
                
                if (currentPage == 3) {
                    WidgetSettingView(currentPage: $currentPage)
                        .environment(themeManager)
                }
                
                VStack {
                    Spacer()
                    TabBarView(currentPage: $currentPage)
                        .environment(themeManager)
                }
                .ignoresSafeArea(.all, edges: .bottom)
            }
        }
        .modelContainer(CardContainer.create(shouldCreateDefaults: &isFirstTimeLaunch))
    }
}
