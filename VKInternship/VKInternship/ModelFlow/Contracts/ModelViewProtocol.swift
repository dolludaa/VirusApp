//
//  ModelViewProtocol.swift
//  VKInternship
//
//  Created by Людмила Долонтаева on 5/10/23.
//

import Foundation
import UIKit

protocol ModelViewProtocol: UIView {
    var container: UIView { get }
    func didLoad()
    func update(healthyCount: Int, unhealthyCount: Int)
}
