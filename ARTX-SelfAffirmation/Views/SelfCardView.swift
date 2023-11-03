//
//  SelfCardView.swift
//  ARTX-SelfAffirmation
//
//  Created by Jae Ho Yoon on 11/2/23.
//

import SwiftUI

struct SelfCardView: View {
    
    @Environment(ThemeManager.self) private var themeManager
    var model: SelfCardViewModel
    
    var body: some View {
        
        // MARK: - 카드 Carousel
        GeometryReader { geometry in
            let size = geometry.size
            
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(model.selfCards) { card in
                        // Parallax Effect
                        GeometryReader { proxy in
                            let cardSize = proxy.size
                            let minX = min((proxy.frame(in: .scrollView).minX - 32.0) * 1.4, size.width * 1.4)
                            
                            Image(card.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .offset(x: -minX)
                                .frame(width: proxy.size.width * 2.2)
                                .frame(width: cardSize.width, height: cardSize.height)
                                .overlay {
                                    overlayView(card)
                                }
                                .clipShape(.rect(cornerRadius: 22))
                                .shadow(color: .black.opacity(0.25), radius: 5, x: 0, y: 16)
                        }
                        .frame(width: size.width - 72, height: size.height - 30)
                        .scrollTransition(.interactive, axis: .horizontal) { view, phase in view
                                .scaleEffect(phase.isIdentity ? 1 : 0.85)
                                .opacity(phase.isIdentity ? 1 : 0.7)
                        }
                    }
                    .padding(.horizontal, -4)
                }
                .padding(.horizontal, 36)
                .scrollTargetLayout()
                .frame(height: size.height, alignment: .top)
            }
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.hidden)
        }
//        .frame(height: 544)
    }
    
    // MARK: - 카드 위에 올라가는 내용
    func overlayView(_ card: SelfCard) -> some View {
        
        VStack(alignment: .center, spacing: 30, content: {
            Text(card.title)
                .font(.system(.title2, design: .serif, weight: .medium))
                .multilineTextAlignment(.center)
                .foregroundStyle(themeManager.selectedTheme.textLightPrimary)
            
            Text(card.name)
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(themeManager.selectedTheme.textLightPrimary)
        })
    }
}

#Preview {
    ContentView()
        .environment(ThemeManager())
}
