//
//  ModelViewControler.swift
//  VKInternship
//
//  Created by Людмила Долонтаева on 5/6/23.
//

import Foundation
import UIKit

class ModelViewControler: UIViewController {

    private let sickTracker: SickTracker
    private let modelView: ModelViewProtocol
    private let totalPeopleNumber: Int

    init(
        modelView: ModelViewProtocol,
        sickTracker: SickTracker,
        totalPeopleNumber: Int
    ) {
        self.modelView = modelView
        self.sickTracker = sickTracker
        self.totalPeopleNumber = totalPeopleNumber
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = modelView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        modelView.didLoad()
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }

    private func setup() {
        sickTracker.onUpdate = { [weak self] in
            guard let self else { return }
            self.modelView.update(
                healthyCount: self.sickTracker.healthyCount,
                unhealthyCount: self.totalPeopleNumber - self.sickTracker.healthyCount
            )
        }

        modelView.update(healthyCount: totalPeopleNumber, unhealthyCount: 0)
    }
}

extension ModelViewControler: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        totalPeopleNumber    }

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

extension ModelViewControler: UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ModelCell
        else { return }

        guard let indexPath = collectionView.indexPath(for: cell) else {
            return
        }

        sickTracker.makeSick(row: indexPath.row / 7, column: indexPath.row % 7)
        collectionView.reloadData()
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return modelView.container
    }
}

extension ModelViewControler: ModelViewControlerProtocolDelegate {}
