//
//  SettingInfoView.swift
//  ARTX-SelfAffirmation
//
//  Created by 신상용 on 11/4/23.
//

import SwiftUI

struct SettingInfoView: View {
    @Environment(ThemeManager.self) private var themeManager
    @Binding var currentPage: Int
    
    var body: some View {
        VStack (spacing: 0) {
            
            Button(action: {
                currentPage = 3
            }, label: {
                SettingInfoRowView(cellTitle: "위젯 설정 방법")
            })
            
            Divider()
                .overlay(themeManager.selectedTheme.tabLine)
                .padding(.leading, 16)
            
            Link(destination: URL(string: "https://artx.imweb.me/")!, label: {
                SettingInfoRowView(cellTitle: "궁금한 점이 있으신가요?")
            })
            
        }
        .background(themeManager.selectedTheme.tabBg)
        .cornerRadius(10)
        .padding(.horizontal, 26)
        
    }
}

struct SettingInfoRowView: View {
    @Environment(ThemeManager.self) private var themeManager
    
    var cellTitle: LocalizedStringResource
    
    var body: some View {
        HStack (spacing: 0) {
            Text(cellTitle)
                .modifier(systemRegular())
                .foregroundStyle(themeManager.selectedTheme.settingPrimary)
            Spacer()
            Image(systemName: "chevron.right")
                .modifier(systemRegular())
                .foregroundColor(themeManager.selectedTheme.settingSecondary)
        }
        .frame(height: 44)
        .padding(.horizontal, 16)
    }
}

struct SettingInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SettingInfoView(currentPage: .constant(3))
            .previewLayout(.sizeThatFits)
            .environment(ThemeManager())
        //            .padding()
    }
}
