////
////  ContentView.swift
////  ARTX-SelfAffirmation
////
////  Created by 신상용 on 11/2/23.
////
//
import SwiftUI

struct ContentView: View {
    
    @Environment(ThemeManager.self) private var themeManager
    var model = TitleTextViewModel()
    
    @State private var currentCard: SelfCard?
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                let size = geometry.size
                ZStack {
                    VStack(spacing: 16) {
                        HStack {
                            Spacer()
                            NavigationLink(destination: SettingView()) {
                                Image(systemName: "gearshape")
                                    .modifier(iconExLarge())
                                    .foregroundStyle(themeManager.selectedTheme.textLightSecondary)
                                    .padding(.trailing, 27)
                            }
                        }
                        Text(model.text.mainTitle)
                            .modifier(mainTitle())
                        Text(model.text.subTitle)
                            .modifier(bodyRegular())
                        SelfCardView(currentCard: $currentCard)
                            .frame(height: size.height * 0.61 + 50)
                            .padding(.bottom, 45)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                .onAppear(perform: model.updateTitleText)
                .background {
                    Color(.black)
                    Image(currentCard?.image ?? "bg1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .overlay(themeManager.selectedTheme.bgDimed)
                        .blur(radius: 6)
                        .padding(-20)
                        .drawingGroup()
                        .animation(.easeOut(duration: 1), value: currentCard)
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
        .environment(ThemeManager())
}
