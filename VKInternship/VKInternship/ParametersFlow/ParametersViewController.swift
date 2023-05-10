//
//  ParametersViewController.swift
//  VKInternship
//
//  Created by Людмила Долонтаева on 5/6/23.
//

import UIKit

final class ParametersViewController: UIViewController, UITextFieldDelegate {

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

    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == parametersView.groupSizeText || textField == parametersView.timerCountText {
            UIView.animate(withDuration: 0.3) {
                self.parametersView.modelingButton.transform = CGAffineTransform(translationX: 0, y: -270)
            }
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == parametersView.groupSizeText || textField == parametersView.timerCountText {
            UIView.animate(withDuration: 0.3) {
                self.parametersView.modelingButton.transform = .identity
            }
        }
    }
}

extension ParametersViewController: ParametersViewControllerProtocolDelegate {
    func pushVC(newVC: UIViewController) {
        navigationController?.pushViewController(newVC, animated: true)
    }
}
