//
//  ParametersViewControllerAssembly.swift
//  VKInternship
//
//  Created by Людмила Долонтаева on 5/10/23.
//

import Foundation
import UIKit

struct ParametersViewControllerAssembly {
    func create() -> UIViewController {

        let parametersView = ParameteresView()
        let parameterVC = ParametersViewController(
            parametersView: parametersView
        )

        parametersView.delegate = parameterVC

        return parameterVC
    }
}
