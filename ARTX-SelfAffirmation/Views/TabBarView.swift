//
//  TabBarView.swift
//  ARTX-SelfAffirmation
//
//  Created by 신상용 on 11/18/23.
//

import SwiftUI

struct TabBarView: View {
    @Binding var currentPage: Int
    @Environment(ThemeManager.self) private var themeManager
    
    var body: some View {
        VStack(spacing: 0) {
            Divider()
                .frame(height: 0.5)
                .overlay {
                    themeManager.selectedTheme.tabLine
                }
                .offset(y: -0.5)
            themeManager.selectedTheme.tabBg.overlay {
                HStack(spacing: 0) {
                    Spacer()
                    Image(systemName: "house")
                        .modifier(iconLarge())
                        .foregroundStyle(currentPage == 0 ? themeManager.selectedTheme.textPrimary : themeManager.selectedTheme.textDeactive)
                        .onTapGesture {
                            currentPage = 0;
                            print("clicked \(currentPage)");
                        }
                        
                    Spacer()
                    Spacer()
                    Image(systemName: "menucard")
                        .modifier(iconLarge())
                        .foregroundStyle(currentPage == 1 ? themeManager.selectedTheme.textPrimary : themeManager.selectedTheme.textDeactive)
                        .onTapGesture {
                            currentPage = 1;
                            print("clicked \(currentPage)");
                        }
                    Spacer()
                    Spacer()
                    Image(systemName: "gearshape")
                        .modifier(iconLarge())
                        .foregroundStyle(currentPage == 2 ? themeManager.selectedTheme.textPrimary : themeManager.selectedTheme.textDeactive)
                        .onTapGesture {
                            currentPage = 2;
                            print("clicked \(currentPage)");
                        }
                    Spacer()
                }
                .padding(.bottom, bottomSafe())
                
                
                
            }
            .frame(height: bottomSafe() + 50)
        }

        
    }
    func bottomSafe() ->CGFloat {
        let window = UIApplication.shared.windows.first
        let bottomPadding = window?.safeAreaInsets.bottom ?? 0
        return bottomPadding
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(currentPage: .constant(0))
            .environment(ThemeManager())
            .previewLayout(.sizeThatFits)
    }
}
