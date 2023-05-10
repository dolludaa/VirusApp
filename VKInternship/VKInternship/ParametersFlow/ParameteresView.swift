//
//  ParameteresView.swift
//  VKInternship
//
//  Created by Людмила Долонтаева on 5/10/23.
//

import Foundation
import UIKit

final class ParameteresView: UIView {

    weak var delegate: ParametersViewControllerProtocolDelegate?

    private let groupSizeLabel = UILabel()
    private let groupSizeTextField = UITextField()
    private let timerCountLabel = UILabel()
    private let timerCountTextField = UITextField()
    private let interfectionFactorLabel = UILabel()
    private let interfectionFactorSlider = UISlider()
    private let interfectionFactorValueLabel = UILabel()
    private let infectionProbabilityLabel = UILabel()
    private let infectionProbabilitySlider = UISlider()
    private let infectionProbabilityValueLabel = UILabel()
    private let startModelingButton = UIButton()
    private lazy var doneButton = UIBarButtonItem(title: "Готово", style: .plain, target: self, action: #selector(doneButtonTapped))
    private let scrollView = UIScrollView()

    private let groupSizeLeftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 35))
    private let timerCountLeftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 35))

    private func setUpLayout() {
        groupSizeLabel.translatesAutoresizingMaskIntoConstraints = false
        groupSizeTextField.translatesAutoresizingMaskIntoConstraints = false
        timerCountLabel.translatesAutoresizingMaskIntoConstraints = false
        startModelingButton.translatesAutoresizingMaskIntoConstraints = false
        timerCountTextField.translatesAutoresizingMaskIntoConstraints = false
        interfectionFactorLabel.translatesAutoresizingMaskIntoConstraints = false
        interfectionFactorSlider.translatesAutoresizingMaskIntoConstraints = false
        interfectionFactorValueLabel.translatesAutoresizingMaskIntoConstraints = false
        infectionProbabilityLabel.translatesAutoresizingMaskIntoConstraints = false
        infectionProbabilitySlider.translatesAutoresizingMaskIntoConstraints = false
        infectionProbabilityValueLabel.translatesAutoresizingMaskIntoConstraints = false

        addSubview(groupSizeLabel)
        addSubview(groupSizeTextField)
        addSubview(timerCountLabel)
        addSubview(timerCountTextField)
        addSubview(interfectionFactorLabel)
        addSubview(interfectionFactorSlider)
        addSubview(interfectionFactorValueLabel)
        addSubview(infectionProbabilityLabel)
        addSubview(infectionProbabilitySlider)
        addSubview(infectionProbabilityValueLabel)
        addSubview(startModelingButton)

        NSLayoutConstraint.activate([

            groupSizeLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            groupSizeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),

            groupSizeTextField.topAnchor.constraint(equalTo: groupSizeLabel.bottomAnchor, constant: 10),
            groupSizeTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            groupSizeTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            groupSizeTextField.heightAnchor.constraint(equalToConstant: 35),

            timerCountLabel.topAnchor.constraint(equalTo: groupSizeTextField.bottomAnchor, constant: 20),
            timerCountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),

            timerCountTextField.topAnchor.constraint(equalTo: timerCountLabel.bottomAnchor, constant: 10),
            timerCountTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            timerCountTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            timerCountTextField.heightAnchor.constraint(equalToConstant: 35),

            interfectionFactorLabel.topAnchor.constraint(equalTo: timerCountTextField.bottomAnchor, constant: 20),
            interfectionFactorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),

            interfectionFactorValueLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            interfectionFactorValueLabel.centerYAnchor.constraint(equalTo: interfectionFactorSlider.centerYAnchor),
            interfectionFactorValueLabel.heightAnchor.constraint(equalToConstant: 50),
            interfectionFactorValueLabel.topAnchor.constraint(equalTo: interfectionFactorLabel.bottomAnchor, constant: 18),

            interfectionFactorSlider.topAnchor.constraint(equalTo: interfectionFactorLabel.bottomAnchor, constant: 10),
            interfectionFactorSlider.leadingAnchor.constraint(equalTo: interfectionFactorValueLabel.trailingAnchor, constant: 20),
            interfectionFactorSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            interfectionFactorSlider.heightAnchor.constraint(equalToConstant: 28),

            infectionProbabilityLabel.topAnchor.constraint(equalTo: interfectionFactorSlider.bottomAnchor, constant: 20),
            infectionProbabilityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),

            infectionProbabilitySlider.topAnchor.constraint(equalTo: infectionProbabilityLabel.bottomAnchor, constant: 10),
            infectionProbabilitySlider.leadingAnchor.constraint(equalTo: infectionProbabilityValueLabel.trailingAnchor, constant: 20),
            infectionProbabilitySlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            infectionProbabilitySlider.heightAnchor.constraint(equalToConstant: 28),

            infectionProbabilityValueLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            infectionProbabilityValueLabel.centerYAnchor.constraint(equalTo: infectionProbabilitySlider.centerYAnchor),
            infectionProbabilityValueLabel.heightAnchor.constraint(equalToConstant: 50),
            infectionProbabilityValueLabel.topAnchor.constraint(equalTo: infectionProbabilityLabel.bottomAnchor, constant: 10),

            startModelingButton.heightAnchor.constraint(equalToConstant: 50),
            startModelingButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -35),
            startModelingButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35),
            startModelingButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35)
        ])

    }

    private func setUpStyle() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.setItems([doneButton], animated: false)

        let probabilityValue = Int(infectionProbabilitySlider.value.rounded())
        let integerValue = Int(interfectionFactorSlider.value.rounded())

        backgroundColor = AppColor.backgroundColor.color
        delegate?.title = "Параметры"
        //        navigationController?.navigationBar.prefersLargeTitles = true

        groupSizeLabel.text = "количество людей".uppercased()
        groupSizeLabel.textColor = AppColor.textPrimary.color
        groupSizeLabel.font = .systemFont(ofSize: 14)

        groupSizeTextField.layer.cornerRadius = 10
        groupSizeTextField.textColor = .white
        groupSizeTextField.backgroundColor = AppColor.textFieldBackgroundColor.color
        groupSizeTextField.leftView = groupSizeLeftView
        groupSizeTextField.leftViewMode = .always
        groupSizeTextField.keyboardType = .numberPad
        groupSizeTextField.delegate = delegate
        groupSizeTextField.inputAccessoryView = toolbar

        timerCountLabel.text = "период перерасчета".uppercased()
        timerCountLabel.textColor = AppColor.textPrimary.color
        timerCountLabel.font = .systemFont(ofSize: 14)

        timerCountTextField.layer.cornerRadius = 10
        timerCountTextField.textColor = .white
        timerCountTextField.backgroundColor = AppColor.textFieldBackgroundColor.color
        timerCountTextField.leftView = timerCountLeftView
        timerCountTextField.leftViewMode = .always
        timerCountTextField.keyboardType = .numberPad
        timerCountTextField.delegate = delegate
        timerCountTextField.inputAccessoryView = toolbar

        interfectionFactorLabel.text = "фактор заражения".uppercased()
        interfectionFactorLabel.textColor = AppColor.textPrimary.color
        interfectionFactorLabel.font = .systemFont(ofSize: 14)

        interfectionFactorSlider.minimumValue = 0
        interfectionFactorSlider.maximumValue = 8

        infectionProbabilitySlider.minimumValue = 0
        infectionProbabilitySlider.maximumValue = 100

        interfectionFactorValueLabel.text = "\(integerValue)"
        interfectionFactorValueLabel.textColor = .white

        infectionProbabilityValueLabel.text = "\(probabilityValue)%"
        infectionProbabilityValueLabel.textColor = .white

        infectionProbabilityLabel.text = "вероятность заражения".uppercased()
        infectionProbabilityLabel.textColor = AppColor.textPrimary.color
        infectionProbabilityLabel.font = .systemFont(ofSize: 14)

        startModelingButton.setTitle("Запусть моделирование", for: .normal)
        startModelingButton.backgroundColor = AppColor.mainButtonColor.color
        startModelingButton.layer.cornerRadius = 10

    }

    private func setUp() {
        startModelingButton.addTarget(self, action: #selector(modelingButtonDidTap), for: .touchUpInside)
        interfectionFactorSlider.addTarget(self, action: #selector(interfectionSliderValueChanged), for: .valueChanged)
        infectionProbabilitySlider.addTarget(self, action: #selector(infectionProbabilitySliderValueChanged), for: .valueChanged)
    }

    @objc func interfectionSliderValueChanged(_ sender: Int) {
        let integerValue = Int(interfectionFactorSlider.value.rounded())
        interfectionFactorValueLabel.text = "\(integerValue)"
    }

    @objc func infectionProbabilitySliderValueChanged(_ sender: Int) {
        let probabilityValue = Int(infectionProbabilitySlider.value.rounded())
        infectionProbabilityValueLabel.text = "\(probabilityValue)%"
    }

    @objc private func modelingButtonDidTap() {


        guard let text = groupSizeTextField.text,
              let groupSize = Int(text),
              let timeText = timerCountTextField.text,
              let time = Double(timeText)

        else { return }

        let modelViewControler = ModelViewControler(
            totalPeopleNumber: groupSize,
            healthyPeopleNumber: groupSizeTextField.text ?? "",
            sickTracker: SickTracker(
                elementsCount: groupSize ,
                maxRowCount: 7,
                infectPercent: Int(interfectionFactorSlider.value),
                infectRate: Int(infectionProbabilitySlider.value),
                time: time
            ))

        delegate?.pushVC(newVC: modelViewControler)
    }

    @objc func doneButtonTapped() {
        timerCountTextField.resignFirstResponder()
        groupSizeTextField.resignFirstResponder()

    }
}

extension ParameteresView: ParameteresViewProtocol {
    var modelingButton: UIButton {
        startModelingButton
    }

    var groupSizeText: UITextField {
        groupSizeTextField
    }

    var timerCountText: UITextField {
        timerCountTextField
    }

    func didLoad() {
        setUp()
        setUpStyle()
        setUpLayout()
    }
}
