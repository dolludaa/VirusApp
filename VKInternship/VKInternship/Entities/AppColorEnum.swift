//
//  AppColorEnum.swift
//  VKInternship
//
//  Created by Людмила Долонтаева on 5/10/23.
//

import Foundation
import UIKit

enum AppColor {
    case mainButtonColor
    case backgroundColor
    case textPrimary
    case textFieldBackgroundColor
    case cellBackground

    var color: UIColor {
        switch self {
        case .mainButtonColor:
            return UIColor(hex: 0x007AFF)
        case .backgroundColor:
            return UIColor(hex: 0x1F2329)
        case .textPrimary:
            return UIColor(hex: 0xA5A5AC)
        case .textFieldBackgroundColor:
            return UIColor(hex: 0x2B3038)
        case .cellBackground:
            return UIColor(hex: 0x2B3038)
        }
    }
}
