//
//  ModelViewControler.swift
//  VKInternship
//
//  Created by Людмила Долонтаева on 5/6/23.
//

import Foundation
import UIKit

class ModelViewControler: UIViewController {

    private let layout = UICollectionViewFlowLayout()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    private let healthyPersonImageView = UIImageView()
    private let illPersonImageView = UIImageView()
    private let illPeopleNumberLabel = UILabel()
    private let healtyPeopleNumberLabel = UILabel()
    private let totalPeopleNumber: Int
    private let healthyPeopleNumber: String
    private let sickTracker: SickTracker
    private let containerView = UIView()
    private let scrollView = UIScrollView()

    init(totalPeopleNumber: Int, healthyPeopleNumber: String, sickTracker: SickTracker) {
        self.totalPeopleNumber = totalPeopleNumber
        self.healthyPeopleNumber = healthyPeopleNumber
        self.sickTracker = sickTracker
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
        setUpStyle()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }

    private func setUpLayout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        healthyPersonImageView.translatesAutoresizingMaskIntoConstraints = false
        healtyPeopleNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        illPeopleNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        illPersonImageView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false

        containerView.addSubview(collectionView)
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        view.addSubview(healthyPersonImageView)
        view.addSubview(healtyPeopleNumberLabel)
        view.addSubview(illPersonImageView)
        view.addSubview(illPeopleNumberLabel)


        NSLayoutConstraint.activate([

            healtyPeopleNumberLabel.centerYAnchor.constraint(equalTo: healthyPersonImageView.centerYAnchor),
            healtyPeopleNumberLabel.leadingAnchor.constraint(equalTo: healthyPersonImageView.trailingAnchor, constant: 10),

            healthyPersonImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            healthyPersonImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            healthyPersonImageView.widthAnchor.constraint(equalToConstant: 20),
            healthyPersonImageView.heightAnchor.constraint(equalToConstant: 28),

            illPersonImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            illPersonImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            illPersonImageView.widthAnchor.constraint(equalToConstant: 20),
            illPersonImageView.heightAnchor.constraint(equalToConstant: 28),

            illPeopleNumberLabel.centerYAnchor.constraint(equalTo: illPersonImageView.centerYAnchor),
            illPeopleNumberLabel.trailingAnchor.constraint(equalTo: illPersonImageView.leadingAnchor, constant: -10),

            scrollView.topAnchor.constraint(equalTo: healthyPersonImageView.bottomAnchor, constant: 20),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

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
        title = "Модель"
        view.backgroundColor = AppColor.backgroundColor.color

        healthyPersonImageView.image = UIImage(systemName: "figure.stand")
        healthyPersonImageView.tintColor = .yellow

        illPersonImageView.image = UIImage(systemName: "figure.roll.runningpace")
        illPersonImageView.tintColor = .red

        healtyPeopleNumberLabel.text = healthyPeopleNumber
        illPeopleNumberLabel.text = "0"

        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5

        collectionView.register(ModelCell.self, forCellWithReuseIdentifier: ModelCell.reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = AppColor.backgroundColor.color

        scrollView.delegate = self
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 10.0
    }
}

extension ModelViewControler: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        totalPeopleNumber
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ModelCell.reuseIdentifier,
            for: indexPath
        ) as? ModelCell
        else { return UICollectionViewCell() }

        let isHealthy = !sickTracker.grid[indexPath.row / 7][indexPath.row % 7]
        cell.configure(isHealthy: isHealthy)

        return cell
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (view.bounds.width - 40 - 30) / 7
        return CGSize(width: cellWidth, height: cellWidth)
    }
}

extension ModelViewControler: UICollectionViewDelegate, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ModelCell
        else { return }

        guard let indexPath = collectionView.indexPath(for: cell) else {
            return
        }

        sickTracker.makeSick(row: indexPath.row / 7, column: indexPath.row % 7)
        sickTracker.startInfectionTimer()
        collectionView.reloadData()
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return containerView
    }
}

