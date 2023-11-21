//
//  WidgetSettingView.swift
//  ARTX-SelfAffirmation
//
//  Created by 신상용 on 11/4/23.
//

import SwiftUI

struct WidgetSettingView: View {
    @Binding var currentPage: Int
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(ThemeManager.self) private var themeManager
    
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
                        ZStack {
                            HStack {
                                Image(systemName: "chevron.left")
                                    .foregroundStyle(themeManager.selectedTheme.settingPrimary)
                                    .padding(.leading, 8)
                                    .modifier(systemBold())
                                    .onTapGesture {
                                        currentPage = 2
                                    }
                                    
                                Spacer()
                            }
                            
                            
                            Text("위젯 설정 방법")
                                .modifier(systemBold())
                                .foregroundStyle(themeManager.selectedTheme.settingPrimary)
                        }
                    }
                
                Divider()
                    .frame(height: 0.5)
                    .overlay {
                        themeManager.selectedTheme.tabLine
                    }
                    .offset(y: -0.5)
                
                Image("Empty")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(26)
                
                WidgetSettingDiscriptionView()
                    .padding(.leading, 30)
                
                
                Spacer()
            }
            
            
        }
//        .navigationTitle("위젯 설정 방법")
//        .modifier(NavigationBarModifier())  //navigation bar 설정
        
        .ignoresSafeArea(edges: [.top, .bottom])
    }
    func topSafe() ->CGFloat {
        let window = UIApplication.shared.windows.first
        let topPadding = window?.safeAreaInsets.top ?? 0
        return topPadding
    }
}


#Preview {
    NavigationView{
        WidgetSettingView(currentPage: .constant(3))
            .environment(ThemeManager())
    }
}
