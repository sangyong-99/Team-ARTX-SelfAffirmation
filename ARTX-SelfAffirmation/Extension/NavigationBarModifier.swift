//
//  NavigationBarModifier.swift
//  ARTX-SelfAffirmation
//
//  Created by 신상용 on 11/4/23.
//

import SwiftUI

struct NavigationBarModifier: ViewModifier {
    @Environment(\.presentationMode) var presentationMode
    
    func body(content: Content) -> some View {
        
        content
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
//        appearance.shadowColor = .tabLine
        
    
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
