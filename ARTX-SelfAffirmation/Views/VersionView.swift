//
//  VersionView.swift
//  ARTX-SelfAffirmation
//
//  Created by 신상용 on 11/4/23.
//

import SwiftUI

struct VersionView: View {
    @Environment(ThemeManager.self) private var themeManager
    
    var body: some View {
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        
        HStack(spacing: 0) {
            Spacer()
            VStack(spacing: 0) {
                Group {
                    HStack(spacing: 0) {
                        Text("버전 정보 Ver")
                        Text(" \(appVersion ?? "1.0")")
                    }
                    Text("Developed by Team ARTX")
                }
                .modifier(caption())
                .foregroundColor(themeManager.selectedTheme.settingSecondary)
                .multilineTextAlignment(.center)
                .lineSpacing(0)
            }
            Spacer()
        }
    }
}

#Preview {
    VersionView()
        .environment(ThemeManager())
}
