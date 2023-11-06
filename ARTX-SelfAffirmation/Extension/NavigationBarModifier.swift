//
//  NavigationBarModifier.swift
//  ARTX-SelfAffirmation
//
//  Created by 신상용 on 11/4/23.
//

import SwiftUI

struct NavigationBarModifier: ViewModifier {
    @Environment(ThemeManager.self) private var themeManager
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
                    .foregroundColor(themeManager.selectedTheme.textDarkPrimary)
            }
            )
            .navigationBarTitleDisplayMode(.inline)
    }
    
    
    
    func navigationColorSetting() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(Color(hex: "FFFFFF", opacity: 0.1))
        appearance.backgroundEffect = nil
        
        appearance.titleTextAttributes = [.foregroundColor: UIColor(Color(hex: "F7F7F7"))]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
