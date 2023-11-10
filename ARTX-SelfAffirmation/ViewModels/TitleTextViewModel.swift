//
//  TitleTextViewModel.swift
//  ARTX-SelfAffirmation
//
//  Created by Jae Ho Yoon on 11/4/23.
//

import SwiftUI

@Observable
final class TitleTextViewModel {
    var text: TitleText
    
    init() {
        text = TitleText(mainTitle: "좋은 아침이에요!", subTitle: "오늘도 긍정 확언과 함께 목표를 향해 열심히 달려봐요!")
        updateTitleText()
    }
    
    func updateTitleText() {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
        let hour = Int(formatter.string(from: Date())) ?? 9
        
        var greeting: LocalizedStringResource {
            switch hour {
            case 6..<12:
                return "좋은 아침이에요!"
            case 12..<18:
                return "행복한 오후에요!"
            case 18..<22:
                return "평온한 저녁이에요!"
            default:
                return "오늘도 수고 많았어요"
            }
        }
        text.mainTitle = greeting
    }
}
