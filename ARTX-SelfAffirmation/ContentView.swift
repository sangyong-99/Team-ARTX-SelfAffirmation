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
    var model = SelfCardViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            ZStack {
                VStack(spacing: 15) {
                    Text("좋은 아침이에요")
                        .font(.system(.largeTitle, design: .serif, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 10)
                    
                    SelfCardView(model: model)
                        .frame(height: size.height * 0.6 + 30)
                    
                    Menu("Card Feature") {
                        Button("Shuffle", action: { model.shuffleCard() })
                        Button("Change 1st Card BG", action: { model.changeimage(0, to: SelfCardImage.allCases.randomElement()!.rawValue) })
                        
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
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
