//
//  ParametersViewControllerProtocolDelegate.swift
//  VKInternship
//
//  Created by Людмила Долонтаева on 5/10/23.
//

import Foundation
import UIKit

protocol ParametersViewControllerProtocolDelegate: AnyObject, UITextFieldDelegate {
    var navigationItem: UINavigationItem { get }
    var title: String? { get set }
    func modelingButtonDidTap()
}
