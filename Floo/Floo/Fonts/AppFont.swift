//
//  AppFont.swift
//  Floo
//
//  Created by Windy Claudia Napitupulu on 21/08/26.
//

import CoreText
import SwiftUI

enum AppFont {
    static let plusJakartaSans = "PlusJakartaSans-Regular"

    static func registerFonts() {
        registerFont(named: "PlusJakartaSans", extension: "ttf")
    }

    private static func registerFont(named name: String, extension fileExtension: String) {
        let fontURL = Bundle.main.url(forResource: name, withExtension: fileExtension)
            ?? Bundle.main.url(forResource: name, withExtension: fileExtension, subdirectory: "Fonts")

        guard let fontURL else { return }

        CTFontManagerRegisterFontsForURL(fontURL as CFURL, .process, nil)
    }
}

enum AppTextStyle {
    case largeTitle
    case largeTitleBold
    case largeTitleItalic
    case largeTitleBoldItalic
    case title1
    case title1Bold
    case title1Italic
    case title1BoldItalic
    case title2
    case title2Bold
    case title2Italic
    case title2BoldItalic
    case title3
    case title3Bold
    case title3Italic
    case title3BoldItalic
    case headline
    case headlineBold
    case headlineItalic
    case headlineBoldItalic
    case body
    case bodyBold
    case bodyItalic
    case bodyBoldItalic
    case callout
    case calloutBold
    case calloutItalic
    case calloutBoldItalic
    case subheadline
    case subheadlineBold
    case subheadlineItalic
    case subheadlineBoldItalic
    case footnote
    case footnoteBold
    case footnoteItalic
    case footnoteBoldItalic
    case caption1
    case caption1Bold
    case caption1Italic
    case caption1BoldItalic
    case caption2
    case caption2Bold
    case caption2Italic
    case caption2BoldItalic

    var font: Font {
        var font = Font.custom(AppFont.plusJakartaSans, size: size, relativeTo: relativeTextStyle)
            .weight(weight)

        if isItalic {
            font = font.italic()
        }

        return font
    }

    private var size: CGFloat {
        switch self {
        case .largeTitle, .largeTitleBold, .largeTitleItalic, .largeTitleBoldItalic:
            34
        case .title1, .title1Bold, .title1Italic, .title1BoldItalic:
            28
        case .title2, .title2Bold, .title2Italic, .title2BoldItalic:
            22
        case .title3, .title3Bold, .title3Italic, .title3BoldItalic:
            20
        case .headline, .headlineBold, .headlineItalic, .headlineBoldItalic:
            17
        case .body, .bodyBold, .bodyItalic, .bodyBoldItalic:
            17
        case .callout, .calloutBold, .calloutItalic, .calloutBoldItalic:
            16
        case .subheadline, .subheadlineBold, .subheadlineItalic, .subheadlineBoldItalic:
            15
        case .footnote, .footnoteBold, .footnoteItalic, .footnoteBoldItalic:
            13
        case .caption1, .caption1Bold, .caption1Italic, .caption1BoldItalic:
            12
        case .caption2, .caption2Bold, .caption2Italic, .caption2BoldItalic:
            11
        }
    }

    private var weight: Font.Weight {
        switch self {
        case .largeTitleBold, .largeTitleBoldItalic,
             .title1Bold, .title1BoldItalic,
             .title2Bold, .title2BoldItalic,
             .title3Bold, .title3BoldItalic,
             .headlineBold, .headlineBoldItalic,
             .bodyBold, .bodyBoldItalic,
             .calloutBold, .calloutBoldItalic,
             .subheadlineBold, .subheadlineBoldItalic,
             .footnoteBold, .footnoteBoldItalic,
             .caption1Bold, .caption1BoldItalic,
             .caption2Bold, .caption2BoldItalic:
            .bold
        case .headline, .headlineItalic:
            .semibold
        default:
            .regular
        }
    }

    private var isItalic: Bool {
        switch self {
        case .largeTitleItalic, .largeTitleBoldItalic,
             .title1Italic, .title1BoldItalic,
             .title2Italic, .title2BoldItalic,
             .title3Italic, .title3BoldItalic,
             .headlineItalic, .headlineBoldItalic,
             .bodyItalic, .bodyBoldItalic,
             .calloutItalic, .calloutBoldItalic,
             .subheadlineItalic, .subheadlineBoldItalic,
             .footnoteItalic, .footnoteBoldItalic,
             .caption1Italic, .caption1BoldItalic,
             .caption2Italic, .caption2BoldItalic:
            true
        default:
            false
        }
    }

    private var relativeTextStyle: Font.TextStyle {
        switch self {
        case .largeTitle, .largeTitleBold, .largeTitleItalic, .largeTitleBoldItalic:
            .largeTitle
        case .title1, .title1Bold, .title1Italic, .title1BoldItalic:
            .title
        case .title2, .title2Bold, .title2Italic, .title2BoldItalic:
            .title2
        case .title3, .title3Bold, .title3Italic, .title3BoldItalic:
            .title3
        case .headline, .headlineBold, .headlineItalic, .headlineBoldItalic:
            .headline
        case .body, .bodyBold, .bodyItalic, .bodyBoldItalic:
            .body
        case .callout, .calloutBold, .calloutItalic, .calloutBoldItalic:
            .callout
        case .subheadline, .subheadlineBold, .subheadlineItalic, .subheadlineBoldItalic:
            .subheadline
        case .footnote, .footnoteBold, .footnoteItalic, .footnoteBoldItalic:
            .footnote
        case .caption1, .caption1Bold, .caption1Italic, .caption1BoldItalic:
            .caption
        case .caption2, .caption2Bold, .caption2Italic, .caption2BoldItalic:
            .caption2
        }
    }
}

private struct AppTextStyleModifier: ViewModifier {
    let style: AppTextStyle
    let color: Color

    func body(content: Content) -> some View {
        content
            .font(style.font)
            .foregroundStyle(color)
    }
}

extension Text {
    func appTextStyle(_ style: AppTextStyle, color: Color = .appLabel) -> some View {
        self
            .font(style.font)
            .foregroundStyle(color)
    }
}

extension View {
    func appTextStyle(_ style: AppTextStyle, color: Color = .appLabel) -> some View {
        modifier(AppTextStyleModifier(style: style, color: color))
    }
}

extension Font {
    static func plusJakartaSans(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        .custom(AppFont.plusJakartaSans, size: size)
            .weight(weight)
    }
}

