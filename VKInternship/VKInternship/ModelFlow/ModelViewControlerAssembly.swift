//
//  ModelViewControlerAssembly.swift
//  VKInternship
//
//  Created by Людмила Долонтаева on 5/10/23.
//

import Foundation
import UIKit

struct ModelViewControlerAssembly {
    func create(
        totalPeopleNumber: Int,
        infectPercent: Int,
        infectRate: Int,
        infectInterval: Int
    ) -> UIViewController {

        let sickTracker = SickTracker(
            elementsCount: totalPeopleNumber,
            maxRowCount: 7,
            infectPercent: infectPercent,
            infectRate: infectRate,
            infectInterval: infectInterval
        )

        let modelView = ModelView()
        let modelVC = ModelViewControler(
            modelView: modelView,
            sickTracker: sickTracker,
            totalPeopleNumber: totalPeopleNumber
        )

        modelView.delegate = modelVC

        return modelVC
    }
}
