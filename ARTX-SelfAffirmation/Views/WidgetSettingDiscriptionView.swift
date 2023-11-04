//
//  WidgetSettingDiscriptionView.swift
//  ARTX-SelfAffirmation
//
//  Created by 신상용 on 11/4/23.
//

import SwiftUI

struct WidgetSettingDiscriptionView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            WidgetSettingDiscriptionRowView(index: 1, description: "홈 화면을 터치한 채로 길게 눌러주세요")
            WidgetSettingDiscriptionRowView(index: 2, description: "왼쪽 상단의 + 버튼을 터치합니다")
            WidgetSettingDiscriptionRowView(index: 3, description: "리스트에서 ‘켈리최 자기확언’을 선택하세요")
            WidgetSettingDiscriptionRowView(index: 4, description: "위젯을 추가합니다")
        }
    }
}

#Preview {
    WidgetSettingDiscriptionView()
}
