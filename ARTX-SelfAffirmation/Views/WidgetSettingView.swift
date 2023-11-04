//
//  WidgetSettingView.swift
//  ARTX-SelfAffirmation
//
//  Created by 신상용 on 11/4/23.
//

import SwiftUI

struct WidgetSettingView: View {
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
                Divider()
                    .frame(height: 0.5)
                    .overlay {
                        Color.tabLine
                    }
                    .offset(y: -0.5)
                
                Image("Empty")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(26)
                
                WidgetSettingDiscriptionView()
                    .padding(.leading, 30)
                
                
                Spacer()
                
                VersionView()
                
            }
            
            
        }
        .navigationTitle("위젯 설정 방법")
        .modifier(NavigationBarModifier())  //navigation bar 설정
        
        
    }
}


#Preview {
    NavigationView{
        WidgetSettingView()
    }
}
