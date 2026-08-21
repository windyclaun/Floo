import SwiftUI

extension Font {
    private static func plusJakarta(_ variant: String, size: CGFloat, relativeTo style: Font.TextStyle) -> Font {
        .custom("PlusJakartaSans-\(variant)", size: size, relativeTo: style)
    }

    // MARK: - Titles
    static let appTitle = plusJakarta("Bold", size: 34, relativeTo: .largeTitle)
    static let appTitle2 = plusJakarta("Bold", size: 22, relativeTo: .title2)
    static let appTitle3 = plusJakarta("Bold", size: 20, relativeTo: .title3)
    // MARK: - Headline / Body
    static let appHeadline = plusJakarta("SemiBold", size: 17, relativeTo: .headline)
    static let appBody = plusJakarta("Regular", size: 17, relativeTo: .body)
    // MARK: - Support
    static let appFootnote = plusJakarta("Regular", size: 13, relativeTo: .footnote)
    static let appCaption = plusJakarta("Medium", size: 12, relativeTo: .caption)
    static let appCaption2 = plusJakarta("Medium", size: 11, relativeTo: .caption2)
}
