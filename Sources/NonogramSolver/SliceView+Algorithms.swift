extension SliceView {
    /// If the sum of all hints + the count of hints - 1 is equal
    /// to the slice dimension length, the slice has only one
    /// possible solution.
    mutating func solveWholeSliceIfPossible() {
        let filledCount = hints.reduce(0, +)
        let requiredGaps = hints.count - 1
        guard dimensionLength - requiredGaps == filledCount else {
            return
        }

        let filledSegments = hints.map { Array(repeating: Slot.filled, count: $0) }
        let allSlots = Array(filledSegments.joined(separator: [.unfilled]))
        mutableForEachWithIndex { slot, index in
            slot = allSlots[index]
        }
    }
}
