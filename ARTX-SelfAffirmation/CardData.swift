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
    
    init(id: Int, title: String, name: String, image: String) {
//        self.id = UUID().uuidString
        self.id = id
        self.title = title
        self.name = name
        self.image = image
    }
    
    static var defaults: [CardData] {
        [
            .init(id: 0, title: "경제적으로 자유로운\n삶을 위해 2024년까지\n월 1억 시스템을 달성한다\n(카드가 길어져서 좀 더\n길게 들어가도 될 듯)", name: "MARCUS", image: "bg0"),
            .init(id: 1, title: "단 하나의 꿈은,\n수천가지 현실적인 요소보다\n더 강력합니다.", name: "PUPPY", image: "bg1"),
            .init(id: 2, title: "당신이 원하는 것은\n모두 두려움\n뒷 편에 있다.", name: "N.D", image: "bg2"),
            .init(id: 3, title: "진정성, 균형,\n창의성, 경험,\n공정", name: "LENA", image: "bg3"),
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

