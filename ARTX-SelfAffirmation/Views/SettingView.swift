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
    @Binding var currentPage: Int
    
//    init() {
//        NavigationBarModifier().navigationColorSetting()
//    }
    
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
                themeManager.selectedTheme.tabBg.overlay {
                    
                }
                .frame(height: topSafe())
                Rectangle()
                    .frame(height: 44)
                    .foregroundColor(themeManager.selectedTheme.tabBg)
                
                    .overlay {
                        Text("환경 설정")
                            .modifier(systemBold())
                            .foregroundStyle(themeManager.selectedTheme.settingPrimary)
                    }
                
                
                
                Divider()
                    .frame(height: 0.5)
                    .overlay {
                        themeManager.selectedTheme.tabLine
                    }
                    .offset(y: -0.5)
                
                HStack(spacing: 0) {
                    Image(systemName: "bell.badge")
                        .modifier(iconRegular())
                        .foregroundColor(themeManager.selectedTheme.settingPrimary)
                        .padding(.trailing, 8)
                    Text("알림 설정")
                        .modifier(headline())
                        .foregroundColor(themeManager.selectedTheme.settingPrimary)
                    Spacer()
                }
                .padding(EdgeInsets(top: 30, leading: 26, bottom: 0, trailing: 0))
                
                Text("오전 9:00에 랜덤한 확언 알림을 보내드려요")
                    .modifier(caption())
                    .foregroundColor(themeManager.selectedTheme.settingPrimary)
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
                        .foregroundColor(themeManager.selectedTheme.settingPrimary)
                        .padding(.trailing, 8)
                    Text("어플리케이션 정보")
                        .modifier(headline())
                        .foregroundColor(themeManager.selectedTheme.settingPrimary)
                    Spacer()
                }
                .padding(.leading, 26)
                
                SettingInfoView(currentPage: $currentPage)
                    .padding(.top, 18)
                
                
                Spacer()
                
                VersionView()
                    .padding(.bottom, 32 + bottomSafe() + 50)
                
            }
            
            .ignoresSafeArea(edges: [.top, .bottom])
            
        }
        .navigationTitle("환경 설정")
        .modifier(NavigationBarModifier())  //navigation bar 설정
        .onAppear(perform: {
            themeManager.applyTheme(1);
        })
        
    }
    func bottomSafe() ->CGFloat {
        let window = UIApplication.shared.windows.first
        let bottomPadding = window?.safeAreaInsets.bottom ?? 0
        return bottomPadding
    }
    func topSafe() ->CGFloat {
        let window = UIApplication.shared.windows.first
        let topPadding = window?.safeAreaInsets.top ?? 0
        return topPadding
    }
}





#Preview {
    SettingView(currentPage: .constant(2))
        .environment(ThemeManager())
}
