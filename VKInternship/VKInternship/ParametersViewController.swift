//
//  ParametersViewController.swift
//  VKInternship
//
//  Created by Людмила Долонтаева on 5/6/23.
//

import UIKit

class ParametersViewController: UIViewController {

    private let groupSizeLabel = UILabel()
    private let groupSize = UITextField()
    private let timerCountLabel = UILabel()
    private let timerCount = UITextField()
    private let interfectionFactorLabel = UILabel()
    private let interfectionFactorSlider = UISlider()
    private let interfectionFactorValueLabel = UILabel()
    private let infectionProbabilityLabel = UILabel()
    private let infectionProbabilitySlider = UISlider()
    private let infectionProbabilityValueLabel = UILabel()
    private let startModeling = UIButton()

    private let groupSizeLeftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 35))
    private let timerCountLeftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 35))

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
        setUpStyle()
        setUp()
    }

    private func setUpLayout() {
        groupSizeLabel.translatesAutoresizingMaskIntoConstraints = false
        groupSize.translatesAutoresizingMaskIntoConstraints = false
        timerCountLabel.translatesAutoresizingMaskIntoConstraints = false
        startModeling.translatesAutoresizingMaskIntoConstraints = false
        timerCount.translatesAutoresizingMaskIntoConstraints = false
        interfectionFactorLabel.translatesAutoresizingMaskIntoConstraints = false
        interfectionFactorSlider.translatesAutoresizingMaskIntoConstraints = false
        interfectionFactorValueLabel.translatesAutoresizingMaskIntoConstraints = false
        infectionProbabilityLabel.translatesAutoresizingMaskIntoConstraints = false
        infectionProbabilitySlider.translatesAutoresizingMaskIntoConstraints = false
        infectionProbabilityValueLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(groupSizeLabel)
        view.addSubview(groupSize)
        view.addSubview(timerCountLabel)
        view.addSubview(timerCount)
        view.addSubview(interfectionFactorLabel)
        view.addSubview(interfectionFactorSlider)
        view.addSubview(interfectionFactorValueLabel)
        view.addSubview(infectionProbabilityLabel)
        view.addSubview(infectionProbabilitySlider)
        view.addSubview(infectionProbabilityValueLabel)
        view.addSubview(startModeling)

        NSLayoutConstraint.activate([

            groupSizeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            groupSizeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            groupSize.topAnchor.constraint(equalTo: groupSizeLabel.bottomAnchor, constant: 10),
            groupSize.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            groupSize.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            groupSize.heightAnchor.constraint(equalToConstant: 35),

            timerCountLabel.topAnchor.constraint(equalTo: groupSize.bottomAnchor, constant: 20),
            timerCountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            timerCount.topAnchor.constraint(equalTo: timerCountLabel.bottomAnchor, constant: 10),
            timerCount.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            timerCount.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            timerCount.heightAnchor.constraint(equalToConstant: 35),

            interfectionFactorLabel.topAnchor.constraint(equalTo: timerCount.bottomAnchor, constant: 20),
            interfectionFactorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            interfectionFactorValueLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            interfectionFactorValueLabel.centerYAnchor.constraint(equalTo: interfectionFactorSlider.centerYAnchor),
            interfectionFactorValueLabel.heightAnchor.constraint(equalToConstant: 50),
            interfectionFactorValueLabel.topAnchor.constraint(equalTo: interfectionFactorLabel.bottomAnchor, constant: 18),

            interfectionFactorSlider.topAnchor.constraint(equalTo: interfectionFactorLabel.bottomAnchor, constant: 10),
            interfectionFactorSlider.leadingAnchor.constraint(equalTo: interfectionFactorValueLabel.trailingAnchor, constant: 20),
            interfectionFactorSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            interfectionFactorSlider.heightAnchor.constraint(equalToConstant: 28),

            infectionProbabilityLabel.topAnchor.constraint(equalTo: interfectionFactorSlider.bottomAnchor, constant: 20),
            infectionProbabilityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            infectionProbabilitySlider.topAnchor.constraint(equalTo: infectionProbabilityLabel.bottomAnchor, constant: 10),
            infectionProbabilitySlider.leadingAnchor.constraint(equalTo: infectionProbabilityValueLabel.trailingAnchor, constant: 20),
            infectionProbabilitySlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            interfectionFactorSlider.heightAnchor.constraint(equalToConstant: 28),

            infectionProbabilityValueLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            infectionProbabilityValueLabel.centerYAnchor.constraint(equalTo: infectionProbabilitySlider.centerYAnchor),
            infectionProbabilityValueLabel.heightAnchor.constraint(equalToConstant: 50),
            infectionProbabilityValueLabel.topAnchor.constraint(equalTo: infectionProbabilityLabel.bottomAnchor, constant: 10),

            startModeling.heightAnchor.constraint(equalToConstant: 50),
            startModeling.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35),
            startModeling.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            startModeling.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35)
        ])

    }

    private func setUpStyle() {
        let probabilityValue = Int(infectionProbabilitySlider.value.rounded())
        let integerValue = Int(interfectionFactorSlider.value.rounded())

        navigationItem.title = "Параметры"
        navigationController?.navigationBar.prefersLargeTitles = true

        groupSizeLabel.text = "количество людей".uppercased()
        groupSizeLabel.textColor = AppColor.textPrimary.color
        groupSizeLabel.font = .systemFont(ofSize: 14)

        groupSize.layer.cornerRadius = 10
        groupSize.textColor = .white
        groupSize.backgroundColor = AppColor.textFieldBackgroundColor.color
        groupSize.leftView = groupSizeLeftView
        groupSize.leftViewMode = .always

        timerCountLabel.text = "период перерасчета".uppercased()
        timerCountLabel.textColor = AppColor.textPrimary.color
        timerCountLabel.font = .systemFont(ofSize: 14)

        timerCount.layer.cornerRadius = 10
        timerCount.textColor = .white
        timerCount.backgroundColor = AppColor.textFieldBackgroundColor.color
        timerCount.leftView = timerCountLeftView
        timerCount.leftViewMode = .always

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

        startModeling.setTitle("Запусть моделирование", for: .normal)
        startModeling.backgroundColor = AppColor.mainButtonColor.color
        startModeling.layer.cornerRadius = 10

        view.backgroundColor = AppColor.backgroundColor.color
    }

    private func setUp() {
        startModeling.addTarget(self, action: #selector(modelingButtonDidTap), for: .touchUpInside)
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
        let modelViewControler = ModelViewControler()
        navigationController?.pushViewController(modelViewControler, animated: true)
    }
}



enum AppColor {
    case mainButtonColor
    case backgroundColor
    case textPrimary
    case textFieldBackgroundColor

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
        }
    }
}

extension UIColor {
    convenience init(hex: UInt32, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
