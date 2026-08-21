//
//  AppColor.swift
//  Floo
//
//  Created by Windy Claudia Napitupulu on 21/08/26.
//

import SwiftUI
import UIKit

enum AppColor {
    static func dynamic(light: UInt, dark: UInt) -> Color {
        Color(
            uiColor: UIColor { traitCollection in
                let hex = traitCollection.userInterfaceStyle == .dark ? dark : light
                return UIColor(hex: hex)
            }
        )
    }

    static func fixed(_ hex: UInt) -> Color {
        Color(uiColor: UIColor(hex: hex))
    }
}

extension Color {
    static let appAccent = AppColor.fixed(0x235347)
    static let appTextOnPrimary = AppColor.fixed(0xFFFFFF)

    static let appTextPrimary = AppColor.dynamic(light: 0x10201C, dark: 0xF2F7F4)
    static let appTextSecondary = AppColor.dynamic(light: 0x53635D, dark: 0xA9B8B1)
    static let appTextDisabled = AppColor.dynamic(light: 0xCACACA, dark: 0x545F59)

    static let appBackground = AppColor.dynamic(light: 0xFAF7F0, dark: 0x071210)
    static let appSecondaryBackground = AppColor.dynamic(light: 0xFFFCF5, dark: 0x0D1D19)
    static let appTertiaryBackground = AppColor.dynamic(light: 0xEFE9DD, dark: 0x0C1A15)

    static let appSeparator = AppColor.dynamic(light: 0xEEE8DC, dark: 0x263A33)
    static let appBorder = AppColor.dynamic(light: 0xEEE8DC, dark: 0x263A33)

    static let appLabel = appTextPrimary
    static let appSecondaryLabel = appTextSecondary
    static let appTertiaryLabel = appTextDisabled
    static let appQuaternaryLabel = appTextDisabled
}

private extension UIColor {
    convenience init(hex: UInt, alpha: CGFloat = 1) {
        self.init(
            red: CGFloat((hex >> 16) & 0xFF) / 255,
            green: CGFloat((hex >> 8) & 0xFF) / 255,
            blue: CGFloat(hex & 0xFF) / 255,
            alpha: alpha
        )
    }
}
