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
                HStack(spacing: 0) {
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
                                .offset(x: -minX)
                                .overlay {
                                    VStack {
                                        overlayView(card)
                                            .frame(width: cardSize.width * 0.86, height: cardSize.width)
                                        Spacer()
                                        Button {
                                            let image = render(card: card, proxy: proxy)
                                            shareImage(image: image)
                                        } label: {
                                            Image(systemName: "square.and.arrow.up")
                                                .modifier(iconExLarge())
                                                .foregroundStyle(themeManager.selectedTheme.textPrimary)
                                        }
                                        .padding(.bottom, cardSize.height * 0.074)
                                    }
                                    .padding(.top, cardSize.height * 0.13)
                                }
                                .clipShape(.rect(cornerRadius: 22))
                                .drawingGroup()
                                .shadow(color: .black.opacity(0.25), radius: 5, x: 0, y: 16)
                                .contentShape(Rectangle())
                        }
                        .padding(.horizontal, -4)
                        .frame(width: size.width * 0.815, height: size.height - 50)
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
                .sensoryFeedback(.impact(flexibility: .soft, intensity: 1.0), trigger: lastCard)
            }
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.hidden)
            .scrollPosition(id: $currentCard)
        }
    }
    
    // MARK: - 카드 위에 올라가는 내용
    func overlayView(_ card: CardData) -> some View {
        
        VStack(alignment: .center, spacing: 30, content: {
            Group {
                Text(NSLocalizedString(card.title, comment: "card title"))
                    .modifier(quoteTitle())
                Text(card.name)
                    .modifier(namenote())
            }
            .multilineTextAlignment(.center)
            .foregroundStyle(themeManager.selectedTheme.textPrimary)
        })
    }
    
    @MainActor func render(card: CardData, proxy: GeometryProxy) -> UIImage  {
        let renderer = ImageRenderer(content: CardView(card: card, proxy: proxy))
        
        print(proxy.size.width)
        print(proxy.size.height)
        
        renderer.scale = 3.0
      
        let image = cropImage(inputImage: renderer.uiImage!, toRect: CGRect(x: 0, y: 514 * 0.4, width: 318 * renderer.scale, height: 318 * renderer.scale), viewWidth: (renderer.uiImage?.size.width)!, viewHeight: (renderer.uiImage?.size.height)!)
            
            return image!
    }
        
    
    func CardView(card: CardData, proxy: GeometryProxy) -> some View {
        Image(card.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 318, height: 514)
            .overlay {
                overlayView(card)
                    .frame(width: proxy.size.width * 0.86, height: proxy.size.width)
                    .padding(.bottom, 55)
            }
    }
    
    func shareImage(image: UIImage) {
        let textToShare: [Any] = [ MyActivityItemSource(image: image), image ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        
        activityViewController.completionWithItemsHandler = { (activityType, completed, items, error) in
            if let error = error {
                print("ActivityViewController Error: \(error)")
            } else if completed, let activityType = activityType, activityType.rawValue == "com.instagram.exclusivegram" {
                if let viewController = UIApplication.shared.windows.first?.rootViewController {
                    InstagramActivity.shared.shareToInstagram(image: image, from: viewController)
                }
            }
        }
        
        if let viewController = UIApplication.shared.windows.first?.rootViewController {
            viewController.present(activityViewController, animated: true, completion: nil)
        }
    }
    
    func cropImage(inputImage: UIImage, toRect cropRect: CGRect, viewWidth: CGFloat, viewHeight: CGFloat) -> UIImage?
    {
        let imageViewScale = max(inputImage.size.width / viewWidth,
                                 inputImage.size.height / viewHeight)
        
        
        // Scale cropRect to handle images larger than shown-on-screen size
        let cropZone = CGRect(x:cropRect.origin.x * imageViewScale,
                              y:cropRect.origin.y * imageViewScale,
                              width:cropRect.size.width * imageViewScale,
                              height:cropRect.size.height * imageViewScale)
        
        
        // Perform cropping in Core Graphics
        guard let cutImageRef: CGImage = inputImage.cgImage?.cropping(to:cropZone)
        else {
            return nil
        }
        
        
        // Return image to UIImage
        let croppedImage: UIImage = UIImage(cgImage: cutImageRef)
        return croppedImage
    }
    
    func isIPhoneSE() -> Bool {
        return UIDevice.current.model == "iPhone SE"
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
