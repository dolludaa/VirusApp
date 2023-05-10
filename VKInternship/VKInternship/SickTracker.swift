import Foundation

class SickTracker {
    private(set) var grid: [[Bool]] = []
    private let infectPercent: Int
    private let infectRate: Int
    private let time: TimeInterval

    init(elementsCount: Int, maxRowCount: Int, infectPercent: Int, infectRate: Int, time: TimeInterval) {
        var elementsLeft = elementsCount

        while elementsLeft > maxRowCount {
            grid.append(Array(repeating: false, count: maxRowCount))
            elementsLeft -= maxRowCount
        }

        if elementsLeft != 0 {
            grid.append(Array(repeating: false, count: elementsLeft))
        }

        self.infectPercent = infectPercent
        self.infectRate = infectRate
        self.time = time
    }

    func makeSick(row: Int, column: Int) {
        grid[row][column] = true
    }

    func startInfectionTimer() {
        Timer.scheduledTimer(withTimeInterval: time, repeats: true) { [weak self] timer in
            self?.tryToInfect()
        }
    }

    private func tryToInfect() {
        for row in grid.indices {
            for column in grid[0].indices {
                if grid[row][column] {
                    infectNeighboursOf(row: row, column: column)
                }
            }
        }
    }

    private func infectNeighboursOf(row: Int, column: Int) {
        var infectRateLeft = infectRate

        for dr in -1...1 {
            for dc in -1...1 {
                let neighbourRow = row + dr
                let neighbourColumn = column + dc

                if grid.indices.contains(neighbourRow),
                   grid[neighbourRow].indices.contains(neighbourColumn),
                   !grid[neighbourRow][neighbourColumn],
                   Int.random(in: 1...100) <= infectPercent {
                    grid[neighbourRow][neighbourColumn] = true
                    infectRateLeft -= 1

                    if infectRateLeft == 0 {
                        return
                    }
                }
            }
        }
    }
}
