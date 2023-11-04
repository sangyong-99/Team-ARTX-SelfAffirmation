//
//  WidgetSettingDiscriptionRowView.swift
//  ARTX-SelfAffirmation
//
//  Created by 신상용 on 11/4/23.
//

import SwiftUI

struct WidgetSettingDiscriptionRowView: View {
    
    let index: Int
    let description: String
    
    var body: some View {
        HStack(spacing: 0) {
            ZStack {
                Circle()
                    .frame(width: 20, height: 20)
                .foregroundColor(.pointPrimary)
                Text("\(index)")
                    .modifier(iconSmall())
                    .foregroundColor(.textDarkPrimary)
                
            }
            .padding(.trailing, 8)
            
            Text(description)
                .modifier(headline())
                .foregroundColor(.textDarkPrimary)
        }
        .padding(.bottom, 16)
    }
}

struct WidgetSettingDiscriptionRowView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetSettingDiscriptionRowView(index: 1, description: "홈 화면을 터치한 채로 길게 눌러주세요")
            .previewLayout(.sizeThatFits)
    }
}
