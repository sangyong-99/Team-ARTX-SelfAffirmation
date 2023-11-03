//
//  SelfCard.swift
//  ARTX-SelfAffirmation
//
//  Created by Jae Ho Yoon on 11/2/23.
//

import SwiftUI

// Self Card Model
struct SelfCard: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var name: String
    var image: String
}

enum SelfCardImage: String, CaseIterable {
    case bg1
    case bg2
    case bg3
    case bg4
}
