//
//  SettingView.swift
//  ARTX-SelfAffirmation
//
//  Created by 신상용 on 11/3/23.
//

import SwiftUI

struct SettingView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(ThemeManager.self) private var themeManager
    
    init() {
        NavigationBarModifier().navigationColorSetting()
        
    }
    
    var body: some View {
            ZStack {
                Color.clear.overlay {
                    Image("SettingBG")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Divider()
                        .frame(height: 0.5)
                        .overlay {
                            themeManager.selectedTheme.tabLine
                        }
                        .offset(y: -0.5)
                        
                    HStack(spacing: 0) {
                        Image(systemName: "bell.badge")
                            .modifier(iconRegular())
                            .foregroundColor(themeManager.selectedTheme.textDarkPrimary)
                            .padding(.trailing, 8)
                        Text("알림 설정")
                            .modifier(headline())
                            .foregroundColor(themeManager.selectedTheme.textDarkPrimary)
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 30, leading: 26, bottom: 0, trailing: 0))
                    
                    Text("오전 9:00부터 오후 9:00까지 확언 알림을 보내드려요")
                        .modifier(caption())
                        .foregroundColor(themeManager.selectedTheme.textDarkPrimary)
                        .padding(EdgeInsets(top: 10, leading: 26, bottom: 0, trailing: 0))
                    
                    
                    SettingAlarmView()
                        .padding(.horizontal, 26)
                        .padding(.top, 18)
                        
                    Divider()
                        .frame(height: 1)
                        .overlay(themeManager.selectedTheme.listDivider)
                        .padding(30)
                    
                    HStack(spacing: 0) {
                        Image(systemName: "platter.filled.top.iphone")
                            .modifier(iconRegular())
                            .foregroundColor(themeManager.selectedTheme.textDarkPrimary)
                            .padding(.trailing, 8)
                        Text("어플리케이션 정보")
                            .modifier(headline())
                            .foregroundColor(themeManager.selectedTheme.textDarkPrimary)
                        Spacer()
                    }
                    .padding(.leading, 26)
                    
                    Text("위젯 설정법과 앱에 대한 추가 정보를 확인하세요")
                        .modifier(caption())
                        .foregroundColor(themeManager.selectedTheme.textDarkPrimary)
                        .padding(EdgeInsets(top: 10, leading: 26, bottom: 0, trailing: 0))
                    
                    SettingInfoView()
                        .padding(.top, 18)
                    
                    Spacer()
                    
                    VersionView()
                        .padding(.bottom, 32)
                        
                }
                .ignoresSafeArea(edges: .bottom)
                
            }
            .navigationTitle("환경 설정")
            .modifier(NavigationBarModifier())  //navigation bar 설정
            
        
    }
}





#Preview {
    NavigationView{
        SettingView()
            .environment(ThemeManager())
//            .navigationBarTitleDisplayMode(.inline)
    }
}
