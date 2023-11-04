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
            //            NavigationLink("환경설정 링크", destination: SettingView())
            GeometryReader { geometry in
                let size = geometry.size
                ZStack {
                    VStack(spacing: 36) {
                        VStack(spacing: 16) {
                            Text(model.text.mainTitle)
                                .modifier(mainTitle())
                            Text(model.text.subTitle)
                                .modifier(bodyRegular())
                        }
                        SelfCardView(currentCard: $currentCard)
                            .frame(height: size.height * 0.6 + 30)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                .onAppear(perform: model.updateTitleText)
                .background {
                    Image(currentCard?.image ?? "bg1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .overlay(themeManager.selectedTheme.bgDimed)
                        .blur(radius: 20)
                        .padding(-50)
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




// MARK: - 환경설정 불러오는 코드

//import SwiftUI
//
//
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            NavigationView {
//                NavigationLink("환경설정 링크", destination: SettingView())
//            }
//
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}
