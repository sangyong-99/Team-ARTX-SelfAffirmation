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
                                    overlayView(card)
                                }
                                .offset(x: -minX)
                                .clipShape(.rect(cornerRadius: 22))
                                .shadow(color: .black.opacity(0.25), radius: 5, x: 0, y: 16)
                                .longPressAvailable()
                                .gesture(
                                    LongPressGesture(minimumDuration: 0.5, maximumDistance: 10)
                                        .onEnded { _ in
                                            if let currentCard {
                                                print("\(currentCard.image) LongPressed")
                                            }
                                        }
                                )
                                .highPriorityGesture(TapGesture()
                                    .onEnded {
                                        if let currentCard {
                                            print("\(currentCard.image) Tapped")
                                        }
                                    }
                                )
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
}

#Preview {
    ContentView()
        .environment(ThemeManager())
}
