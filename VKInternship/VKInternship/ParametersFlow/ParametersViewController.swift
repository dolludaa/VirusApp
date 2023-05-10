//
//  ParametersViewController.swift
//  VKInternship
//
//  Created by Людмила Долонтаева on 5/6/23.
//

import UIKit

final class ParametersViewController: UIViewController {

    private let parametersView: ParameteresViewProtocol

    override func loadView() {
        view = parametersView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        parametersView.didLoad()
    }

    init(
        parametersView: ParameteresViewProtocol
    ) {
        self.parametersView = parametersView
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ParametersViewController: ParametersViewControllerProtocolDelegate {
    func modelingButtonDidTap() {

        guard parametersView.groupSize > 0,
              parametersView.infectPercent > 0,
              parametersView.infectRate > 0,
              parametersView.timerCount > 0
        else { return }

        let modelVC = ModelViewControlerAssembly().create(
            totalPeopleNumber: parametersView.groupSize,
            infectPercent: parametersView.infectPercent,
            infectRate: parametersView.infectRate,
            infectInterval: parametersView.timerCount
        )

        navigationController?.pushViewController(modelVC, animated: true)
    }
}
