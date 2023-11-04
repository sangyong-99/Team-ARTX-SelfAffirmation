//
//  VersionView.swift
//  ARTX-SelfAffirmation
//
//  Created by 신상용 on 11/4/23.
//

import SwiftUI

struct VersionView: View {
    var body: some View {
        HStack(spacing: 0) {
            Spacer()
            VStack(spacing: 0) {
                Text("버전 정보 Ver 1.0")
                    .modifier(VersionViewModifier())
                Text("Developed by Team ARTX")
                    .modifier(VersionViewModifier())
            }
            Spacer()
        }
    }
}

struct VersionViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .modifier(caption())
            .foregroundColor(.textDarkSecondary)
            .multilineTextAlignment(.center)
            .lineSpacing(0)
    }
}

#Preview {
    VersionView()
}
