//
//  ParameteresViewProtocol.swift
//  VKInternship
//
//  Created by Людмила Долонтаева on 5/10/23.
//

import Foundation
import UIKit

protocol ParameteresViewProtocol: UIView {
    var groupSizeText: UITextField { get }
    var timerCountText: UITextField { get }
    var modelingButton: UIButton { get }
    func didLoad()
}
