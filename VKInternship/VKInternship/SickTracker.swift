//
//  SickTracker.swift
//  VKInternship
//
//  Created by Людмила Долонтаева on 5/10/23.
//

import Foundation

class SickTracker {

    var onUpdate = { }
    private(set) var grid: [[Bool]] = []
    private(set) var healthyCount: Int

    private let elementsCount: Int
    private let infectPercent: Int
    private let infectRate: Int

    private let queue = DispatchQueue(label: "SickTracker")
    private var timer = Timer()

    init(
        elementsCount: Int,
        maxRowCount: Int,
        infectPercent: Int,
        infectRate: Int,
        infectInterval: Int
    ) {

        self.elementsCount = elementsCount
        self.healthyCount = elementsCount
        self.infectPercent = infectPercent
        self.infectRate = infectRate

        var elementsCount = elementsCount

        while elementsCount > maxRowCount {
            grid.append(Array(repeating: false, count: maxRowCount))
            elementsCount -= maxRowCount
        }

        if elementsCount != 0 {
            grid.append(Array(repeating: false, count: elementsCount))
        }

        timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(infectInterval), repeats: true) { [weak self] _ in
            self?.tryToInfect()
        }
    }

    func makeSick(row: Int, column: Int) {
        guard !grid[row][column]
        else { return }

        grid[row][column] = true
        healthyCount -= 1
        onUpdate()
    }

    private func tryToInfect() {
        var grid = grid

        queue.async { [weak self] in
            self?.infectOtherCells(prevGrid: grid, grid: &grid)

            DispatchQueue.main.async {
                self?.merge(updatedGrid: grid)
            }
        }
    }

    private func merge(updatedGrid: [[Bool]]) {
        healthyCount = elementsCount

        for r in grid.indices {
            for c in grid[r].indices {
                grid[r][c] = grid[r][c] || updatedGrid[r][c]

                if grid[r][c] {
                    healthyCount -= 1
                }
            }
        }

        onUpdate()

        if healthyCount <= 0 {
            timer.invalidate()
        }
    }

    private func infectOtherCells(prevGrid: [[Bool]], grid: inout [[Bool]]) {
        for r in grid.indices {
            for c in grid[r].indices {
                guard prevGrid[r][c]
                else { continue }

                infectNeighboursOf(r: r, c: c, grid: &grid)
            }
        }
    }

    private func infectNeighboursOf(r: Int, c: Int, grid: inout [[Bool]]) {
        var infectRateLeft = infectRate

        for dr in -1 ... 1 {
            for dc in -1 ... 1 {
                let neighbourRow = r + dr
                let neighbourColumn = c + dc

                guard grid.indices.contains(neighbourRow),
                      grid[neighbourRow].indices.contains(neighbourColumn),
                      !grid[neighbourRow][neighbourColumn],
                      let randomNumber = (1 ... 100).randomElement(),
                      randomNumber <= infectPercent
                else { continue }

                grid[neighbourRow][neighbourColumn] = true
                infectRateLeft -= 1

                if infectRateLeft == 0 { return }
            }
        }
    }
}
