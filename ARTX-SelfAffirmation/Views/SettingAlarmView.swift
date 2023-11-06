//
//  SettingTableView.swift
//  ARTX-SelfAffirmation
//
//  Created by 신상용 on 11/3/23.
//

import SwiftUI

struct SettingAlarmView: View {
    @AppStorage("isAlarmActive") var isAlarmActive: Bool = false
    @Environment(ThemeManager.self) private var themeManager
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Toggle(isOn: $isAlarmActive, label: {
                    Text("알림 켜기")
                        .modifier(systemRegular())
                        .foregroundColor(themeManager.selectedTheme.textDarkPrimary)
                })
                .toggleStyle(SwitchToggleStyle(tint: themeManager.selectedTheme.pointPrimary))
                .padding(.horizontal, 16)
            }
            
            Spacer()
        }
        .background(themeManager.selectedTheme.tabBg)
        
        .frame(height: 44)
        .cornerRadius(10)
        
        
    }
}

struct SettingAlarmView_Previews: PreviewProvider {
    static var previews: some View {
        SettingAlarmView()
            .previewLayout(.fixed(width: 341, height: 44))
            .padding()
    }
}
