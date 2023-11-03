//
//  SettingTableView.swift
//  ARTX-SelfAffirmation
//
//  Created by 신상용 on 11/3/23.
//

import SwiftUI

struct SettingTableView: View {
    @AppStorage("isAlarmActive") var isAlarmActive: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Toggle(isOn: $isAlarmActive, label: {
                    Text("알림 켜기")
                        .modifier(bodyRegular())
                        .foregroundColor(.textDarkPrimary)
                })
                .toggleStyle(SwitchToggleStyle(tint: Color.pointPrimary))
                .padding(.horizontal, 16)
            }
            
            Spacer()
        }
        .background(Color.tabBg)
        
        .frame(height: 44)
        .cornerRadius(10)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SettingTableView()
            .previewLayout(.fixed(width: 341, height: 44))
            .padding()
    }
}
