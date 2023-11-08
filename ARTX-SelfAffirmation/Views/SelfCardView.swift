//
//  SelfCardView.swift
//  ARTX-SelfAffirmation
//
//  Created by Jae Ho Yoon on 11/2/23.
//

import SwiftUI
import SwiftData

struct SelfCardView: View {
    
    @Environment(ThemeManager.self) private var themeManager
    @Query(sort: [SortDescriptor(\CardData.image)]) private var selfCards: [CardData]
//    var model = SelfCardViewModel()
    @AppStorage("lastCard") private var lastCard: Int = 0
    @AppStorage("isLight") private var isLight: Bool = true
    
    @Binding var currentCard: CardData?
    
    var body: some View {
        
        // MARK: - 카드 Carousel
        GeometryReader { geometry in
            let size = geometry.size
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(selfCards, id:\.self) { card in
                        // Parallax Effect
                        GeometryReader { proxy in
                            let cardSize = proxy.size
                            let minX = min((proxy.frame(in: .scrollView).minX - 32.0) * 1.4, size.width * 1.4)
                            Image(card.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: proxy.size.width * 2.2)
                                .frame(width: cardSize.width, height: cardSize.height)
                                .overlay {
                                    VStack {
                                        overlayView(card)
                                        Button {
                                            let image = render(card: card, proxy: proxy)
                                                shareImage(image: image)
                                            print("클릭")
                                        } label: {
                                            Image(systemName: "square.and.arrow.up")
                                                .font(.system(size: 20, weight: .semibold))
                                                .foregroundStyle(themeManager.selectedTheme.textPrimary)
                                        }

                                    }
                                }
                                .offset(x: -minX)
                                .clipShape(.rect(cornerRadius: 22))
                                .shadow(color: .black.opacity(0.25), radius: 5, x: 0, y: 16)
                                .contentShape(Rectangle())
                        }
                        .padding(.horizontal, -4)
                        .frame(width: size.width - 72, height: size.height - 50)
                        .scrollTransition(.interactive, axis: .horizontal) { view, phase in view
                                .scaleEffect(phase.isIdentity ? 1 : 0.85)
                                .opacity(phase.isIdentity ? 1 : 0.7)
                        }
                    }
                    .onAppear {
                        currentCard = selfCards[lastCard]
                    }
                }
                .padding(.horizontal, 36)
                .scrollTargetLayout()
                .frame(height: size.height, alignment: .top)
                .onChange(of: currentCard) {
                    lastCard = currentCard!.id
                    
                    if currentCard!.isLight != isLight {
                        isLight.toggle()
                        themeManager.applyTheme(isLight ? 0 : 1)
                    }
                }
            }
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.hidden)
            .scrollPosition(id: $currentCard)
        }
    }
    
    // MARK: - 카드 위에 올라가는 내용
    func overlayView(_ card: CardData) -> some View {
        
        VStack(alignment: .center, spacing: 30, content: {
            Text(card.title)
                .modifier(quoteTitle())
                .multilineTextAlignment(.center)
                .foregroundStyle(themeManager.selectedTheme.textPrimary)
            
            Text(card.name)
                .modifier(namenote())
                .foregroundStyle(themeManager.selectedTheme.textPrimary)
        })
    }
    
    @MainActor func render(card: CardData, proxy: GeometryProxy) -> UIImage  {
        let renderer = ImageRenderer(content: CardView(card: card, proxy: proxy))
        renderer.scale = 3.0
        return renderer.uiImage!
    }


    func CardView(card: CardData, proxy: GeometryProxy) -> some View {
        Image(card.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: proxy.size.width * 2.2)
            .frame(width: proxy.size.width, height: proxy.size.height)
            .overlay {
                overlayView(card)
            }
    }

    func shareImage(image: UIImage) {
        let textToShare: [Any] = [ MyActivityItemSource(image: image) ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true, completion: nil)
    }

}

#Preview {
    ContentView()
        .environment(ThemeManager())
}
