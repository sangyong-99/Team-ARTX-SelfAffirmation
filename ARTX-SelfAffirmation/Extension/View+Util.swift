//
//  View+Util.swift
//  ARTX-SelfAffirmation
//
//  Created by Jae Ho Yoon on 11/5/23.
//

import SwiftUI

extension View {
    func longPressAvailable() -> some View { modifier(LongPressAvailable()) }
}

private struct LongPressAvailable : ViewModifier {
    
    @State private var disabled = false
    
    func body(content: Content) -> some View {
        content
            .disabled(disabled)
            .onTapGesture { onMain { disabled = true; onMain { disabled = false } } }
    }
    
    private func onMain(_ action: @escaping () -> Void) { DispatchQueue.main.async(execute: action) }
}
