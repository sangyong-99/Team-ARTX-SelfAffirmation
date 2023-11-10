//
//  AppFont.swift
//  ARTX-SelfAffirmation
//
//  Created by 신상용 on 11/3/23.
//

import SwiftUI

struct iconSmall: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("SFPro-Medium", size: 12))
            .tracking(-0.4)
    }
}

struct iconRegular: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("SFPro-Semibold", size: 17))
            .tracking(-0.4)
    }
}

struct iconLarge: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("SFPro-Regular", size: 22))
            .tracking(-0.4)
    }
}

struct iconExLarge: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("SFPro-Regular", size: 24))
            .tracking(-0.4)
    }
}

struct mainTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("NotoSerifKR-Regular", size: 28))
            .lineSpacing(38)
            .tracking(-1.0)
    }
}

struct quoteTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("NotoSerifKR-Regular", size: 24))
            .tracking(-0.4)
    }
}

struct widgetLarge: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("NotoSerifKR-Regular", size: 18))
            .tracking(-0.3)
    }
}

struct widgetSmall: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("NotoSerifKR-Regular", size: 15))
            .tracking(-0.3)
    }
}

struct headline: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Pretendard-SemiBold", size: 15))
            .lineSpacing(20)
            .tracking(-0.3)
    }
}

struct namenote: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Pretendard-SemiBold", size: 12))
            .lineSpacing(20)
            .tracking(4.0)
            .textCase(.uppercase)
    }
}

struct bodyRegular: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Pretendard-Regular", size: 14))
            .lineSpacing(20)
            .tracking(-0.2)
    }
}

struct caption: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Pretendard-Regular", size: 12))
            .lineSpacing(16)
            .tracking(-0.3)
    }
}

struct systemRegular: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("SFPro-Regular", size: 17))
            .lineSpacing(22)
            .tracking(-0.4)
    }
}

struct systemBold: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("SFPro-Semibold", size: 17))
            .lineSpacing(22)
            .tracking(0.0)
    }
}
