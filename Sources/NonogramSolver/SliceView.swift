struct SliceView {
    let axis: Axis
    let hints: Hints
    private let board: GameBoard

    var dimensionLength: Int {
        switch axis {
        case .row:
            return board.size.columns
        case .column:
            return board.size.rows
        }
    }

    init(board: GameBoard, axis: Axis, hints: Hints) {
        self.board = board
        self.axis = axis
        self.hints = hints
    }

    init(board: GameBoard, row: Int, hints: Hints) {
        self.init(board: board, axis: .row(row), hints: hints)
    }

    init(board: GameBoard, column: Int, hints: Hints) {
        self.init(board: board, axis: .column(column), hints: hints)
    }
}

extension SliceView: BidirectionalCollection, MutableCollection {
    var startIndex: Int {
        return 0
    }

    var endIndex: Int {
        switch axis {
        case .row:
            return board.size.columns
        case .column:
            return board.size.rows
        }
    }

    subscript(position: Int) -> Slot {
        get {
            let coordinates = axis.getCoordinates(otherCoordinate: position)
            return board[x: coordinates.x, y: coordinates.y]
        }
        set {
            let coordinates = axis.getCoordinates(otherCoordinate: position)
            board[x: coordinates.x, y: coordinates.y] = newValue
        }
    }

    func index(after index: Int) -> Int {
        index + 1
    }

    func index(before index: Int) -> Int {
        index - 1
    }
}
