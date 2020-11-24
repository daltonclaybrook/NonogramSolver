enum Axis {
    case row(Int)
    case column(Int)
}

extension Axis {
    var value: Int {
        switch self {
        case .row(let value), .column(let value):
            return value
        }
    }

    func getCoordinates(otherCoordinate: Int) -> (x: Int, y: Int) {
        switch self {
        case .row(let yCoordinate):
            return (otherCoordinate, yCoordinate)
        case .column(let xCoordinate):
            return (xCoordinate, otherCoordinate)
        }
    }
}
