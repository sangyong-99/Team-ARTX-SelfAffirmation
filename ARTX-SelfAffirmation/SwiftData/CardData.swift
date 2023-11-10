//
//  CardData.swift
//  ARTX-SelfAffirmation
//
//  Created by Jae Ho Yoon on 11/7/23.
//

import Foundation
import SwiftData

@Model
class CardData: Identifiable, Hashable {
    
    var id: Int
    var title: String
    var name: String
    var image: String
    var isLight: Bool
    
    init(id: Int, title: String, name: String, image: String, isLight: Bool) {
//        self.id = UUID().uuidString
        self.id = id
        self.title = title
        self.name = name
        self.image = image
        self.isLight = isLight
    }
    
    static var defaults: [CardData] {
            [
                .init(id: 0, title: "나는 적절한 시간에 올바른 장소에 있고 올바른 일을 하고 있습니다", name: "Louise Hay", image: "img1", isLight: true),
                .init(id: 1, title: "의식하는 호흡은 저의 닻입니다", name: "Thích Nhất Hạnh", image: "img2", isLight: true),
                .init(id: 2, title: "당신은 단지 당신의 있는 그대로의 존재로, 단지 존재하는걸로 사랑 받습니다", name: "Ram Dass", image: "img3", isLight: false),
                .init(id: 3, title: "어디에 있든지 사랑하고 사랑받을 기회는 존재합니다", name: "Oprah", image: "img4", isLight: false),
                .init(id: 4, title: "용기는 우리가 우리 자신을 보여주는 것에서부터 시작됩니다", name: "Brené Brown", image: "img5", isLight: false),
                .init(id: 5, title: "전에 없던 사태에 대비해 길을 만들고, 현실이 재배치되는 것을 지켜봅니다", name: "Yrsa Daley-Ward", image: "img6", isLight: true),
                .init(id: 6, title: "찬란한 날에 마음을 열고 술을 마시라", name: "Heather Havrilesky", image: "img7", isLight: true),
                .init(id: 7, title: "제가 충분한가요? 네, 그렇습니다", name: "Michelle Obama", image: "img8", isLight: true),
                .init(id: 8, title: "완벽한 순간은 지금 이 순간입니다", name: "Jon Kabat-Zinn", image: "img9", isLight: true),
                .init(id: 9, title: "나는 신중하고 아무것도 두렵지 않습니다", name: "Audre Lord", image: "img10", isLight: true),
                .init(id: 10, title: "당신의 인생은 놀랍습니다", name: "Tim Storey", image: "img11", isLight: false),
                .init(id: 11, title: "당신의 내면은 당신이 인생의 모든 것을 만들고 할 수 있도록 도와줍니다", name: "Fred Rogers", image: "img12", isLight: false),
                .init(id: 12, title: "당신의 관점은 독특합니다. 그것은 중요하고, 가치 있습니다", name: "Glenn Close", image: "img13", isLight: false),
                .init(id: 13, title: "지구 위의 모든 날은 좋은 날입니다", name: "Ernest Hemingway", image: "img14", isLight: false),
                .init(id: 14, title: "그 어떤 것도 빛을 어둡게 할 수 없습니다", name: "Maya Angelou", image: "img15", isLight: false),
                .init(id: 15, title: "할 수 없다고 생각되는 일을 해야 합니다", name: "Eleanor Roosevelt", image: "img16", isLight: true),
                .init(id: 16, title: "매력의 비결은 자신을 사랑하는 것입니다", name: "Deepak Chopra", image: "img17", isLight: false),
                .init(id: 17, title: "자기 관리, 자기 가치 및 자기 가치를 지원하지 않는 결정에 잘 벗어났습니다", name: "Oprah", image: "img18", isLight: true),
                .init(id: 18, title: "나는 가장 위대하다. 나는 내가 그런 줄 알기도 전에 그렇게 말했다", name: "Muhammad Ali", image: "img19", isLight: false),
                .init(id: 19, title: "인생의 밝은 면을 들여다보면 아무도 죽지 않았다고 생각합니다", name: "Jenny Han", image: "img20", isLight: false),
            ]
    }
    
//    func addCard(title: String, name: String, image: String) {
//        self.title = title
//        self.name = name
//        self.image = image
//    }
}



enum SelfCardImage: String, CaseIterable {
    case bg1
    case bg2
    case bg3
    case bg4
}

