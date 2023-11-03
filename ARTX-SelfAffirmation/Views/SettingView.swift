//
//  SettingView.swift
//  ARTX-SelfAffirmation
//
//  Created by 신상용 on 11/3/23.
//

import SwiftUI

struct SettingView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
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
                    HStack(spacing: 0) {
                        Image(systemName: "bell.badge")
                            .modifier(iconRegular())
                            .foregroundColor(.textDarkPrimary)
                            .padding(.trailing, 8)
                        Text("알림 설정")
                            .modifier(headline())
                            .foregroundColor(.textDarkPrimary)
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 30, leading: 26, bottom: 0, trailing: 0))
                    
                    Text("오전 9:00부터 오후 9:00까지 확언 알림을 보내드려요")
                        .modifier(caption())
                        .foregroundColor(.textDarkPrimary)
                        .padding(EdgeInsets(top: 10, leading: 26, bottom: 0, trailing: 0))
                    
                    
                    SettingTableView()
                        .padding(.horizontal, 26)
                        .padding(.top, 18)
                        
                    Divider()
                        .frame(height: 1)
                        .overlay(Color.listDivider)
                        .padding(30)
                    
                    HStack(spacing: 0) {
                        Image(systemName: "platter.filled.top.iphone")
                            .modifier(iconRegular())
                            .foregroundColor(.textDarkPrimary)
                            .padding(.trailing, 8)
                        Text("어플리케이션 정보")
                            .modifier(headline())
                            .foregroundColor(.textDarkPrimary)
                        Spacer()
                    }
                    .padding(.leading, 26)
                    
                    Text("위젯 설정법과 앱에 대한 추가 정보를 확인하세요")
                        .modifier(caption())
                        .foregroundColor(.textDarkPrimary)
                        .padding(EdgeInsets(top: 10, leading: 26, bottom: 0, trailing: 0))
                    
                    
                    
                    Spacer()
                }
                
            }
            .modifier(NavigationBarModifier())  //navigation bar 설정
        
        
    }
}

struct NavigationBarModifier: ViewModifier {
    @Environment(\.presentationMode) var presentationMode
    
    func body(content: Content) -> some View {
        
        content
            .navigationTitle("환경 설정")
            .font(.system(size: 17, weight: .semibold))
            .navigationBarBackButtonHidden()
            .navigationBarItems(leading:
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left") // Custom back button image
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.textDarkPrimary) // Custom back button color
                }
            )
            .navigationBarTitleDisplayMode(.inline)
    }
    
    func navigationColorSetting() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.tabBg // 20% 투명도 지정
        appearance.backgroundEffect = nil
        
        appearance.titleTextAttributes = [.foregroundColor: UIColor.textDarkPrimary]
        appearance.shadowColor = .tabLine
        
    
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}


#Preview {
    NavigationView{
        SettingView()
//            .navigationBarTitleDisplayMode(.inline)
    }
}
