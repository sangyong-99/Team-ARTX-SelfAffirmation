////
////  ContentView.swift
////  ARTX-SelfAffirmation
////
////  Created by 신상용 on 11/2/23.
////
//
import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(ThemeManager.self) private var themeManager
    @Environment(\.modelContext) private var context
    @State private var currentCard: CardData?
    @AppStorage("lastCard") private var lastCard: Int = 0
    @AppStorage("isLight") private var isLight: Bool = true
    
    var model = TitleTextViewModel()
    
    
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
                            .foregroundStyle(themeManager.selectedTheme.textLightPrimary)
                        Text(model.text.subTitle)
                            .modifier(bodyRegular())
                            .foregroundStyle(themeManager.selectedTheme.textLightSecondary)
                        SelfCardView(currentCard: $currentCard)
                            .frame(height: size.height * 0.61 + 50)
                            .padding(.bottom, 45)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                .onAppear {
                    model.updateTitleText()
                }
                .background {
                    Image(currentCard?.image ?? "bg\(lastCard)")
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
    let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: CardData.self, configurations: configuration)
    CardData.defaults.forEach { container.mainContext.insert($0) }
    
    return ContentView()
        .modelContainer(container)
        .environment(ThemeManager())
}
