enum Slot {
    case unknown, filled, unfilled
}

typealias Hints = [Int]

final class GameBoard {
    struct Size {
        let rows: Int
        let columns: Int
    }

    let size: Size
    private var boardData: [Slot]
    private let hintsForRow: [Int: Hints] = [:] // todo
    private let hintsForColumn: [Int: Hints] = [:] // todo

    init(rows: Int, columns: Int) {
        self.size = Size(rows: rows, columns: columns)
        boardData = [Slot](repeating: .unknown, count: rows * columns)
    }

    func getSlice(forRow row: Int) -> SliceView {
        guard (0..<size.columns).contains(row) else {
            fatalError("row out of bounds")
        }
        return SliceView(board: self, row: row, hints: hintsForRow[row] ?? [])
    }

    func getSlice(forColumn column: Int) -> SliceView {
        guard (0..<size.rows).contains(column) else {
            fatalError("column out of bounds")
        }
        return SliceView(board: self, column: column, hints: hintsForColumn[column] ?? [])
    }

    subscript(x xOffset: Int, y yOffset: Int) -> Slot {
        get {
            guard let index = indexFor(xOffset: xOffset, yOffset: yOffset) else {
                fatalError("provided x or y out of bounds")
            }
            return boardData[index]
        }
        set {
            guard let index = indexFor(xOffset: xOffset, yOffset: yOffset) else {
                fatalError("provided x or y out of bounds")
            }
            boardData[index] = newValue
        }
    }

    // MARK: - Private helpers

    private func indexFor(xOffset: Int, yOffset: Int) -> Int? {
        guard (0..<size.columns).contains(xOffset) && (0..<size.rows).contains(yOffset) else { return nil }
        return yOffset * size.columns + xOffset
    }
}
