//
//  ParameteresViewProtocol.swift
//  VKInternship
//
//  Created by Людмила Долонтаева on 5/10/23.
//

import Foundation
import UIKit

protocol ParameteresViewProtocol: UIView {
    var groupSize: Int { get }
    var timerCount: Int { get }
    var infectPercent: Int { get }
    var infectRate: Int { get }
    func didLoad()
}
