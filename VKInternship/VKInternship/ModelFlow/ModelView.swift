//
//  ModelView.swift
//  VKInternship
//
//  Created by Людмила Долонтаева on 5/10/23.
//

import Foundation
import UIKit

class ModelView: UIView {

    weak var delegate: ModelViewControlerProtocolDelegate?

    private let layout = UICollectionViewFlowLayout()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    private let healthyPersonImageView = UIImageView()
    private let illPersonImageView = UIImageView()
    private let illPeopleNumberLabel = UILabel()
    private let healtyPeopleNumberLabel = UILabel()
    private let containerView = UIView()
    private let scrollView = UIScrollView()

    private func setUpLayout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        healthyPersonImageView.translatesAutoresizingMaskIntoConstraints = false
        healtyPeopleNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        illPeopleNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        illPersonImageView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(collectionView)
        addSubview(healthyPersonImageView)
        addSubview(healtyPeopleNumberLabel)
        addSubview(illPersonImageView)
        addSubview(illPeopleNumberLabel)


        NSLayoutConstraint.activate([

            healtyPeopleNumberLabel.centerYAnchor.constraint(equalTo: healthyPersonImageView.centerYAnchor),
            healtyPeopleNumberLabel.leadingAnchor.constraint(equalTo: healthyPersonImageView.trailingAnchor, constant: 10),

            healthyPersonImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 25),
            healthyPersonImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            healthyPersonImageView.widthAnchor.constraint(equalToConstant: 20),
            healthyPersonImageView.heightAnchor.constraint(equalToConstant: 28),

            illPersonImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 25),
            illPersonImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            illPersonImageView.widthAnchor.constraint(equalToConstant: 20),
            illPersonImageView.heightAnchor.constraint(equalToConstant: 28),

            illPeopleNumberLabel.centerYAnchor.constraint(equalTo: illPersonImageView.centerYAnchor),
            illPeopleNumberLabel.trailingAnchor.constraint(equalTo: illPersonImageView.leadingAnchor, constant: -10),

            scrollView.topAnchor.constraint(equalTo: healthyPersonImageView.bottomAnchor, constant: 20),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            containerView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            containerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),

            collectionView.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            collectionView.heightAnchor.constraint(equalTo: containerView.heightAnchor),
            collectionView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            collectionView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
    }

    private func setUpStyle() {
        delegate?.title = "Модель"
        backgroundColor = AppColor.backgroundColor.color

        healthyPersonImageView.image = UIImage(systemName: "figure.stand")
        healthyPersonImageView.tintColor = .yellow

        illPersonImageView.image = UIImage(systemName: "figure.roll.runningpace")
        illPersonImageView.tintColor = .red

        healtyPeopleNumberLabel.text = ""
        illPeopleNumberLabel.text = "0"

        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5

        collectionView.register(ModelCell.self, forCellWithReuseIdentifier: ModelCell.reuseIdentifier)
        collectionView.delegate = delegate
        collectionView.dataSource = delegate
        collectionView.backgroundColor = AppColor.backgroundColor.color

        scrollView.delegate = delegate
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 10.0
    }
}

extension ModelView: ModelViewProtocol {

    var container: UIView {
        containerView
    }

    func didLoad() {
        setUpLayout()
        setUpStyle()
    }

    func update(healthyCount: Int, unhealthyCount: Int) {
        illPeopleNumberLabel.text = String(unhealthyCount)
        healtyPeopleNumberLabel.text = String(healthyCount)

        collectionView.reloadData()
    }
}
