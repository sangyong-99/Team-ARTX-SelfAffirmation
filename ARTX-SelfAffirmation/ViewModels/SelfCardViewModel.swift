//
//  SelfCardViewModel.swift
//  ARTX-SelfAffirmation
//
//  Created by Jae Ho Yoon on 11/2/23.
//

import SwiftUI

@Observable
final class SelfCardViewModel {
    var selfCards = [
        SelfCard(title: "경제적으로 자유로운\n삶을 위해 2024년까지\n월 1억 시스템을 달성한다", name: "M A R C U S", image: "bg1"),
        SelfCard(title: "단 하나의 꿈은,\n수천가지 현실적인 요소보다\n더 강력합니다.", name: "P U P P Y", image: "bg2"),
        SelfCard(title: "당신이 원하는 것은\n모두 두려움\n뒷 편에 있다.", name: "N . D", image: "bg3"),
        SelfCard(title: "진정성, 균형,\n창의성, 경험,\n공정", name: "L E N A", image: "bg4"),
    ]
    
    func shuffleCard() {
        selfCards.shuffle()
    }
    
    func changeTitle(_ id: Int, to title: String) {
        selfCards[id].title = title
    }
    
    func changeimage(_ id: Int, to image: String) {
        selfCards[id].image = image
    }
}
