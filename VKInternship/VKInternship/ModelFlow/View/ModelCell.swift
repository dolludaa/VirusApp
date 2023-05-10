//
//  ModelCell.swift
//  VKInternship
//
//  Created by Людмила Долонтаева on 5/8/23.
//

import Foundation
import UIKit

class ModelCell: UICollectionViewCell {

    static let reuseIdentifier = String(describing: ModelCell.self)

    private let personImageView = UIImageView()

    required init?(coder: NSCoder) {

        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupLayout()
        setupStyle()
    }

    private func setupLayout() {

        personImageView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(personImageView)

        NSLayoutConstraint.activate([
            personImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            personImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    private func setupStyle() {
        backgroundColor = AppColor.cellBackground.color
        layer.cornerRadius = 5
    }

    func configure(isHealthy: Bool) {
        if isHealthy {
            personImageView.image = UIImage(systemName: "figure.stand")
            personImageView.tintColor = .yellow
        } else {
            personImageView.image = UIImage(systemName: "figure.roll.runningpace")
            personImageView.tintColor = .red
        }
    }
}
