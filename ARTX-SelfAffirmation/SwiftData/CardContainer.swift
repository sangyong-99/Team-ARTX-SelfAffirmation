//
//  CardContainer.swift
//  ARTX-SelfAffirmation
//
//  Created by Jae Ho Yoon on 11/7/23.
//

import Foundation
import SwiftData

actor CardContainer {
    
    @MainActor
    static func create(shouldCreateDefaults: inout Bool) -> ModelContainer {
        let schema = Schema([CardData.self])
        let configuration = ModelConfiguration()
        let container = try! ModelContainer(for: schema, configurations: configuration)
        if shouldCreateDefaults {
            CardData.defaults.forEach { container.mainContext.insert($0) }
            shouldCreateDefaults = false
        }
        return container
    }
}
