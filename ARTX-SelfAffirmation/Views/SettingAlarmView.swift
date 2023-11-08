//
//  SettingTableView.swift
//  ARTX-SelfAffirmation
//
//  Created by 신상용 on 11/3/23.
//

import SwiftUI
import UserNotifications

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
                .onChange(of: isAlarmActive) { newValue in
                    if newValue {
                        // 알람을 예약하는 작업 수행
                        NotificationManager().scheduleNotification(identifier: "첫번째 알람")
                        print("알람 예약됨")
                    } else {
                        // 알람을 제거하는 작업 수행
                        NotificationManager().removeNotification()
                        print("알람 제거됨")
                    }
                }

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
            .environment(ThemeManager())
    }
}
