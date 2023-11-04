//
//  SelfCardView.swift
//  ARTX-SelfAffirmation
//
//  Created by Jae Ho Yoon on 11/2/23.
//

import SwiftUI

struct SelfCardView: View {
    
    @Environment(ThemeManager.self) private var themeManager
    var model = SelfCardViewModel()
    
    @Binding var currentCard: SelfCard?
    
    var body: some View {
        
        // MARK: - 카드 Carousel
        GeometryReader { geometry in
            let size = geometry.size
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(model.selfCards, id:\.self) { card in
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
                                            print("\(currentCard!.image) LongPressed ")
                                        }
                                )
                                .highPriorityGesture(TapGesture()
                                    .onEnded { print("\(currentCard!.image) Tapped") }
                                )
                        }
                        .padding(.horizontal, -4)
                        .frame(minWidth: size.width - 72, minHeight: size.height - 50)
                        .scrollTransition(.interactive, axis: .horizontal) { view, phase in view
                                .scaleEffect(phase.isIdentity ? 1 : 0.85)
                                .opacity(phase.isIdentity ? 1 : 0.7)
                        }
                    }
                }
                .padding(.horizontal, 36)
                .scrollTargetLayout()
                .frame(height: size.height, alignment: .top)
                .onAppear {
                    currentCard = model.selfCards[0]
                }
            }
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.hidden)
            .scrollPosition(id: $currentCard)
        }
    }
    
    // MARK: - 카드 위에 올라가는 내용
    func overlayView(_ card: SelfCard) -> some View {
        
        VStack(alignment: .center, spacing: 30, content: {
            Text(card.title)
                .modifier(quoteTitle())
                .multilineTextAlignment(.center)
                .foregroundStyle(themeManager.selectedTheme.textLightPrimary)
            
            Text(card.name)
                .modifier(namenote())
                .foregroundStyle(themeManager.selectedTheme.textLightPrimary)
        })
    }
}

#Preview {
    ContentView()
        .environment(ThemeManager())
}
