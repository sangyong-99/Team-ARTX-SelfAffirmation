//
//  SettingInfoView.swift
//  ARTX-SelfAffirmation
//
//  Created by 신상용 on 11/4/23.
//

import SwiftUI

struct SettingInfoView: View {
    var body: some View {
        VStack (spacing: 0) {
            
            NavigationLink(destination: WidgetSettingView()) {
                SettingInfoRowView().view(cellTitle: "위젯 설정 방법")
            }
            
            Divider()
                .overlay(Color.tabLine)
                .padding(.leading, 16)
            
            Button(action: {
                print("궁금")
            }, label: {
                SettingInfoRowView().view(cellTitle: "궁금한 점이 있으신가요?")
            })
            
        }
        .background(Color.tabBg)
        .cornerRadius(10)
        .padding(.horizontal, 26)
        
    }
}

struct SettingInfoRowView {
    @ViewBuilder
    func view(cellTitle: String) -> some View {
        HStack (spacing: 0) {
            Text(cellTitle)
                .modifier(systemRegular())
                .foregroundColor(.textDarkPrimary)
            Spacer()
            Image(systemName: "chevron.right")
                .modifier(systemRegular())
                .foregroundColor(.textDarkSecondary)
        }
        .frame(height: 44)
        .padding(.horizontal, 16)
    }
}

struct SettingInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SettingInfoView()
            .previewLayout(.sizeThatFits)
        //            .padding()
    }
}
